function createPenguin(x, y)
  local tileDeck = engine:loadTileDeck(
    "assets/sprites/penguin/penguinspreadsheet.png",
    8, 7, 
    0, 0, 64, 64
  )
  
  local penguin = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC )
  
  table.insert(penguin.factions, 'penguins')
  
  --penguin.canTurn = false
  penguin.preJump = false -- boolean to check if penguin is prejumping so we disalow uber jump
  
  -- ,0 are beacuse the last frame is never played
  mergeTables(penguin.prop, {
    walk = {1, 2, 3, 4, 5, 6, 7, 8, 0},
    preJump = {9, 10, 11, 12, 0},
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
  
  local pengRect = penguin.body:addPolygon(createSmoothEdgePolygon(15, 3, 49, 42, 4, 4))
  
  --[[ the 'getting stuck problem ' is an problem known to box2d. apparently adding edges / chain could make the problem less apparant. Does work sometimes, but not reliable. Fails with multiple penguins on screen.
  http://www.iforce2d.net/b2dtut/ghost-vertices
  
  local t = {
    v1 = {1.7, 0.0},
    v2 = {1.0, 0.25},
    v3 = {0.4, -1},
    v4 = {-1.7, 0.4}
  }
  
  penguin.body:addEdges(t) -- :addChain(chain)]]--
  
  pengRect:setFriction( config.penguinFriction )
  pengRect:setCollisionHandler(penguinCollisionHandler, MOAIBox2DArbiter.BEGIN)  
  
  
  penguin.previousVector = { x = 0, y = 0 }
  penguin.currentVector = { x = 0, y = 0 }
  
  penguin.update = penguin:extend(penguin.update, function(self)
    self.currentVector.x, self.currentVector.y = self.body:getLinearVelocity()
    
    if self.stateSwitched == true then
      self:setAnimation(self.activeTable)
      self.stateSwitched = false
    end
    
    local velX, velY = self.body:getLinearVelocity()
    local velChange = config.penguinSpeed - velX
    local impulse = self.body:getMass() * velChange
    
    self.body:applyLinearImpulse(impulse, 0)

    if self.currentVector.y < 0 and self.previousVector.y >= 0 then
      self:setAnimationTable(self.prop.falling)
    end
    
    if self.currentVector.y == 0 and self.previousVector.y ~= 0 then
      self:setAnimationTable(self.prop.landing)
        
      local promise = createPromise(0.30, function()
        self:setAnimationTable(self.prop.walk)  
      end)
    end
    
    self.previousVector.x = self.currentVector.x
    self.previousVector.y = self.currentVector.y
    
    if self.x < -200 or self.y > 200 or self.x > engine.currentLevel.width + 200 or self.y < -engine.currentLevel.height - 200 then
      engine:deleteGameObject(self)
    end    
    
  end)

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
      
      local promise = createPromise(0.30, function()        
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
  
  penguin:setAnimationTable(penguin.prop.walk)
  engine.gameStats:newPenguin()
  
  return penguin
end

function penguinCollisionHandler(phase, fixtureA, fixtureB, arbiter )
  
  if engine:isInFaction(fixtureB:getBody().parent, "snowflakes") then
    --print("name: "..fixtureB:getBody().parent.name)
    local snowflakename = fixtureB:getBody().parent.name
    fixtureB:getBody().parent:onPenguinCollision()    
    engine:deleteGameObject(fixtureB:getBody().parent)
    engine.gameStats:updateStats(snowflakename)
  end
  
  if engine:isInFaction(fixtureB:getBody().parent, "iglos") then
    print("Colided with iglo")
    engine.gameStats:updateStats("iglo")
    fixtureB:getBody().parent:onPenguinCollision()
    engine:deleteGameObject(fixtureA:getBody().parent)
  end
  
  if engine:isInFaction(fixtureB:getBody().parent, "jumpBoosts") then
    print("Colided with jumpBoost")
    
    local body = fixtureA:getBody()
    local velX, velY = body:getLinearVelocity()
    local velChange = config.jumpBoostSpeed / config.unitToMeter - velX
    local impulse = body:getMass() * velChange
    
    body:applyLinearImpulse(0, impulse)

  end
end
