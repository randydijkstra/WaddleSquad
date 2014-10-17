function createPenguin(x, y)
  local tileDeck = engine:loadTileDeck(
    "assets/sprites/penguin/penguinspreadsheet.png",
    8, 7, 
    0, 0, 64, 64
  )
  
  local penguin = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC )
  penguin.maxSpd = config.maxSpeed
  penguin.spd = config.penguinSpeed
  penguin.animationSpd = config.penguinAnimationSpeed
  penguin.sleeping = false
  
  table.insert(penguin.factions, 'penguins')
  
  --penguin.canTurn = false
  penguin.preJump = false -- boolean to check if penguin is prejumping so we disalow uber jump
  
  -- ,0 are beacuse the last frame is never played
  penguin.animTables = {
    walk = {1, 2, 3, 4, 5, 6, 7, 8, 0},
    preJump = { 9, 10, 11 }, --{9, 10, 11, 12, 0},
    jump = {17, 18, 19, 20, 21, 0},
    falling = {25, 0},
    landing = {33, 34, 35, 36, 0},
    idle = {41, 42, 43, 44, 0},
    death = {49, 50, 0}
  }
   
  penguin.previousVector = { x = 0, y = 0 }
  penguin.currentVector = { x = 0, y = 0 }
  
  penguin.update = penguin:extend(penguin.update, function(self)
    
    if self.x < -32 then
      self:turn( -30 )   
      self:checkDirection()
    end  
    
    -- correction for the sprite being to far to the left when flipping
    if self.prop:getScl() < 0 then 
      self.prop:setLoc(self.x + 64, self.y)
    end
    
    penguin:checkDirection()
    penguin:checkAnimation()
    penguin:walk()
    
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
  
  function penguin:checkDirection()
    local sclX, sclY = self.prop:getScl()

    if isPositive(self.spd) then
      if isPositive(sclX) == false then           
        self.prop:setScl(sclX * -1, sclY)  
      end
    else
      if isPositive(sclX) then
        self.prop:setScl(sclX * -1, sclY)  
      end
    end   
  end
  
  function penguin:checkAnimation()

    if self.sleeping then
      return
    end

    if self.currentVector.y < 0 and self.previousVector.y >= 0 then
      self:setAnimation(self.animTables.falling)
    end
    
    if self.currentVector.y == 0 and self.previousVector.y ~= 0 then
      local sound = engine:playSound("assets/sounds/Bounce02.mp3")
      self:setAnimation(self.animTables.landing)
        
      local promise = createPromise(0.30, function()
        self:setAnimation(self.animTables.walk)  
      end)
    end
  end

  function penguin:turn(x, spd)
    self.spd = iif(spd, spd, self.spd * -1)
    self:setCorrectionPromise( { x = x, y = self.y } ) -- we use the correction mechanims because this could also be called in the box2d updates
  end
  
  function penguin:jump()
    local x, y = self.body:getLinearVelocity()
    
    if y == 0 and penguin.preJump == false then 

      self:setAnimation(self.animTables.preJump)
      penguin.preJump = true
      
      local promise = createPromise(countTable(self.animTables.preJump) * config.penguinAnimationSpeed , function()        
        self.body:applyLinearImpulse(
          0, 
          config.penguinJumpForce / config.unitToMeter
        )
        local sound = engine:playSound("assets/sounds/Bounce02.mp3")
        self.preJump = false
        self:setAnimation(self.animTables.jump) 
      end)
    
    end
  end
  
  function penguin:jumpBoost()
    local velX, velY = self.body:getLinearVelocity()
    local velChange = config.jumpBoostSpeed / config.unitToMeter - velX
    local impulse = self.body:getMass() * velChange
    
    self.body:applyLinearImpulse(0, impulse)  
    self:setAnimation(self.animTables.jump)
    local promise = createPromise(0.6, function()
        self:setAnimation({21, 0})
    end)
    local sound = engine:playSound("assets/sounds/Bear_Gunter.wav", 0.4)
  end
  
  function penguin:enterIglo()
    local x, y = engine:mainToUi(self.x+64/2, self.y+64)
    engine:addGameObject(createScore(x, y, config.penguinFinishedPoints, 75, 50, 35))
    engine.gameStats:updateStats("iglo")
    local sound = engine:playSound("assets/sounds/Grabbing_Snowflake_Big.wav", 1)
    engine:deleteGameObject(self)  
  end
  
  function penguin:setToSleep()
    self.spd = 0
    self.animationSpd = 0.25
    self:setAnimation(self.animTables.idle)
    self.sleeping = true
  end
  
  function penguin:setFixtures()
    local pengRect = self.body:addPolygon(createSmoothEdgePolygon(15, 3, 49, 42))
 
    pengRect:setFriction( config.penguinFriction )
    pengRect:setCollisionHandler(penguinBeginCollisionHandler, MOAIBox2DArbiter.BEGIN + MOAIBox2DArbiter.POST_SOLVE )  
    pengRect:setFilter(config.maskBits.penguin, config.maskBits.floor + config.maskBits.snowflake + config.maskBits.iglo + config.maskBits.jumpBoostSensor + config.maskBits.waterBoostPlatform )
  end
  
  penguin:setFixtures()
  penguin:setAnimation(penguin.animTables.walk)
  engine.gameStats:newPenguin()
  
  return penguin
end

function penguinBeginCollisionHandler(phase, fixtureA, fixtureB, arbiter )
  
  if phase == MOAIBox2DArbiter.BEGIN then

    if engine:isInFaction(fixtureB:getBody().parent, "snowflakes") then
      fixtureB:getBody().parent:collect()
    end
    
    if engine:isInFaction(fixtureB:getBody().parent, "iglos") then
      fixtureA:getBody().parent:enterIglo()
    end
    
    if engine:isInFaction(fixtureB:getBody().parent, "jumpBoosts") then
      fixtureA:getBody().parent:jumpBoost()
    end
    
  elseif phase == MOAIBox2DArbiter.POST_SOLVE then
    if engine:isInFaction(fixtureB:getBody().parent, "floor") then
      
      local aParent = fixtureA:getBody().parent
      local bParent = fixtureB:getBody().parent
      
      local spdX, spdY = fixtureA:getBody():getLinearVelocity()
      local x, y = arbiter:getContactNormal()     
      
      local xDif = (aParent.x + 64 / 2 ) - (bParent.x + bParent.width / 2)

      if x == -1 and spdY <= 0 or x == 1 and spdY <= 0 then -- I am currently guessing the x is the getContactNormal has somthing to do with the collision direction
        
        local spd = iif(isPositive(xDif),
          math.abs(aParent.spd),
          iif(isPositive(aParent.spd) == false, aParent.spd, aParent.spd * -1)
        )
        local x = iif(isPositive(xDif), aParent.x + 3, aParent.x - 3)
        aParent:turn(x, spd)
        aParent:checkDirection()
      end
    end
  end
  

end
