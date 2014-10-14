function createPenguin(x, y)
  local tileDeck = engine:loadTileDeck(
    "assets/sprites/penguin/penguinspreadsheet.png",
    8, 7, 
    0, 0, 64, 64
  )
  
  local penguin = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC )
  penguin.maxSpd = config.maxSpeed
  penguin.spd = config.penguinSpeed 
  
  table.insert(penguin.factions, 'penguins')
  
  --penguin.canTurn = false
  penguin.preJump = false -- boolean to check if penguin is prejumping so we disalow uber jump
  
  -- ,0 are beacuse the last frame is never played
  mergeTables(penguin.prop, {
    walk = {1, 2, 3, 4, 5, 6, 7, 8, 0},
    preJump = { 9, 10 }, --{9, 10, 11, 12, 0},
    jump = {17, 18, 19, 20, 21, 0},
    falling = {25, 0},
    landing = {33, 34, 35, 36, 0},
    idle = {41, 42, 43, 44, 0},
    death = {49, 50, 0}
  })
  
  animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #penguin.prop.walk)

  for i = 1, #penguin.prop.walk, 1 do
    animCurve:setKey( i, config.penguinAnimationSpeed * (i-1), penguin.prop.walk[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end

  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, penguin.prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()
  
  local pengRect = penguin.body:addPolygon(createSmoothEdgePolygon(15, 3, 49, 42))
  
  pengRect:setFriction( config.penguinFriction )
  pengRect:setCollisionHandler(penguinBeginCollisionHandler, MOAIBox2DArbiter.BEGIN + MOAIBox2DArbiter.POST_SOLVE )  
  pengRect:setFilter(config.maskBits.penguin, config.maskBits.floor + config.maskBits.snowflake + config.maskBits.iglo + config.maskBits.jumpBoostSensor )
  
  penguin.previousVector = { x = 0, y = 0 }
  penguin.currentVector = { x = 0, y = 0 }
  
  penguin.update = penguin:extend(penguin.update, function(self)
    self.currentVector.x, self.currentVector.y = self.body:getLinearVelocity()
    
    if self.x < -32 then
      self:turn( math.abs(self.x + 32)+2 )      
    end  
    
    -- correction for the sprite being to far to the left when flipping
    if self.prop:getScl() < 0 then 
      self.prop:setLoc(self.x + 64, self.y)
    end
    
    penguin:checkAnimation()
    penguin:walk()
    
    self.previousVector.x = self.currentVector.x
    self.previousVector.y = self.currentVector.y
    
    self:capSpeed()
    
    if self.x < -200 or self.y > 200 or self.x > engine.currentLevel.width + 200 or self.y < -engine.currentLevel.height - 200 then
      engine:deleteGameObject(self)
    end    
  end)

  function penguin:walk()
    local velX, velY = self.body:getLinearVelocity()
    local velChange = self.spd - velX
    local impulse = self.body:getMass() * velChange
    
    self.body:applyLinearImpulse(impulse, 0)   
  end
  
  function penguin:checkAnimation()
    if self.stateSwitched == true then
      self:setAnimation(self.activeTable)
      self.stateSwitched = false
    end

    if self.currentVector.y < 0 and self.previousVector.y >= 0 then
      self:setAnimationTable(self.prop.falling)
    end
    
    if self.currentVector.y == 0 and self.previousVector.y ~= 0 then
      self:setAnimationTable(self.prop.landing)
        
      local promise = createPromise(0.30, function()
        self:setAnimationTable(self.prop.walk)  
      end)
    end
  end

  function penguin:turn(normalX)

    self.spd = self.spd * -1
    self:setCorrectionPromise( { x = self.x + normalX, y = self.y } ) -- we use the correction mechanims because this could also be called in the box2d updates
    local sclX, sclY = self.prop:getScl()
    self.prop:setScl(sclX * -1, sclY)  
    
  end

  function penguin:setAnimation(activeTable)
    animCurve = MOAIAnimCurve.new()
    animCurve:reserveKeys( #activeTable)

    for i = 1, #activeTable, 1 do
        animCurve:setKey( i, config.penguinAnimationSpeed * (i-1), activeTable[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
    end

    anim = MOAIAnim.new()
    anim:reserveLinks( 1 )
    anim:setLink( 1, animCurve, self.prop, MOAIProp2D.ATTR_INDEX )
    anim:setMode( MOAITimer.LOOP )
    anim:start()
  end
  
  function penguin:jump()
    local x, y = self.body:getLinearVelocity()
    
    if y == 0 and penguin.preJump == false then 
    
      self:setAnimationTable(self.prop.preJump)
      penguin.preJump = true
      
      local promise = createPromise(countTable(self.prop.preJump) * config.penguinAnimationSpeed , function()        
        self.body:applyLinearImpulse(
          0, 
          config.penguinJumpForce / config.unitToMeter
        )
         
        self.preJump = false
        self:setAnimationTable(self.prop.jump)        
      end)
    
    end
  end
  
  function penguin:setAnimationTable(activeTable)
    self.activeTable = activeTable
    self.stateSwitched = true
  end
  
  function penguin:jumpBoost()
    local velX, velY = self.body:getLinearVelocity()
    local velChange = config.jumpBoostSpeed / config.unitToMeter - velX
    local impulse = self.body:getMass() * velChange
    
    self.body:applyLinearImpulse(0, impulse)  
    
    local sound = engine:playSound("assets/sounds/Bounce02.mp3")
  end
  
  function penguin:enterIglo()
    local x, y = engine:mainToUi(self.x+64/2, self.y+64)
    engine:addGameObject(createScore(x, y, 200, 75, 50, 35))
    engine.gameStats:updateStats("iglo")
    local sound = engine:playSound("assets/sounds/Grabbing_Snowflake_Big.wav", 1)
    engine:deleteGameObject(self)  
  end
  
  penguin:setAnimationTable(penguin.prop.walk)
  engine.gameStats:newPenguin()
  
  return penguin
end

function penguinBeginCollisionHandler(phase, fixtureA, fixtureB, arbiter )
  
  if phase == MOAIBox2DArbiter.BEGIN then

    if engine:isInFaction(fixtureB:getBody().parent, "snowflakes") then
      fixtureB:getBody().parent:collect()
    end
    
    if engine:isInFaction(fixtureB:getBody().parent, "iglos") then
      engine.gameStats:updateStats("iglo")
      fixtureA:getBody().parent:enterIglo()
    end
    
    if engine:isInFaction(fixtureB:getBody().parent, "jumpBoosts") then
      fixtureA:getBody().parent:jumpBoost()
    end
    
  elseif phase == MOAIBox2DArbiter.POST_SOLVE then
    if engine:isInFaction(fixtureB:getBody().parent, "floor") then
      local spdX, spdY = fixtureA:getBody():getLinearVelocity()
      local x, y = arbiter:getContactNormal()     
      
      if x == -1 and spdY <= 0 or x == 1 and spdY <= 0 then -- I am currently guessing the x is the getContactNormal has somthing to do with the collision direction
        fixtureA:getBody().parent:turn(x*3)
      end
    end
  end

end
