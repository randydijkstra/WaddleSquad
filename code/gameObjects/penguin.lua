function createPenguin(x, y)
  local penguin = createMoveableGameObject(x, y)
  
  table.insert(penguin.factions, 'penguins')
  table.insert(penguin.factions, 'update')
  
  local stateSwitched = false
  penguin.forceX = 10
  penguin.forceY = 100
  penguin.canTurn = false
  
  penguin.preJump = false -- boolean to check if penguin is prejumping so we disalow uber jump
  
  local tileDeck = engine:loadTileDeck(
    "assets/sprites/penguin/penguinspreadsheet.png",
    8, 7, 
    0, 0, 64, 64
  )
  
  local prop = MOAIProp2D.new()
  prop:setDeck(tileDeck)
  prop:setLoc(penguin.x, -penguin.y)
  
  --animation tables 
  local animationSpeed = 0.15
  -- ,0 are beacuse the last frame is never played
  prop.walk = {1, 2, 3, 4, 5, 6, 7, 8, 0}
  prop.preJump = {9, 10, 11, 12, 0}
  prop.jump = {17, 18, 19, 20, 21, 0}
  prop.falling = {25, 0}
  prop.landing = {33, 34, 35, 36, 0}
  prop.idle = {41, 42, 43, 44, 0}
  prop.death = {49, 50, 0}
  
  local activeTable = prop.walk
  
  penguin.prop = prop
  
  animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #activeTable)

  for i = 1, #activeTable, 1 do
    animCurve:setKey( i, animationSpeed * (i-1), prop.walk[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end

  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()

  local body = engine.box2DWorld:addBody( MOAIBox2DBody.DYNAMIC )
  body:setTransform(penguin.x, penguin.y)
  
  local pengRect = body:addRect(15, 0, 49, 44)
  pengRect:setFriction( config.penguinFriction )
  pengRect:setCollisionHandler(penguinCollisionHandler)  
  
  penguin.body = body
  
  penguin.previousVector = { x = 0, y = 0 }
  penguin.currentVector = { x = 0, y = 0 }
 
  function penguin:update()
    self.currentVector.x, self.currentVector.y = self.body:getLinearVelocity()
   
    local x, y = body:getPosition()
 
    if self.stateSwitched == true then
      self:setAnimation(self.activeTable)
      self.stateSwitched = false
    end
    
    
    local velX, velY = self.body:getLinearVelocity()
    local velChange = config.penguinSpeed - velX
    local impulse = self.body:getMass() * velChange
    
    self.body:applyLinearImpulse(impulse, 0)
    
    -- This can and wil porabply be linked automaticly
    self.prop:setLoc(x, y)

    if self.currentVector.y < 0 and self.previousVector.y >= 0 then
      self:setAnimationTable(self.prop.falling)
      print('falliiing')
    end
    
    if self.currentVector.y == 0 and self.previousVector.y ~= 0 then
      self:setAnimationTable(self.prop.landing)
      print('landing')

      function backToWalk()
        self:setAnimationTable(self.prop.walk)
        print('walking')
      end
        
      local promise = createPromise(0.30, backToWalk)
    end

    --[[if self.canTurn == true and self.currentVector.x == self.previousVector.x then
      print('Gotta turn this penguin booty!')
    end
    if self.canTurn == false then
      print('canTurn = false.')
      function checkToTurn()
        self.canTurn = true
        print('Change canTurn to true')
      end
      local promise = createPromise(0.2, checkToTurn)
    end]]--
    
    self.previousVector.x = self.currentVector.x
    self.previousVector.y = self.currentVector.y
  end 

  function penguin:setAnimation(activeTable)
    animCurve = MOAIAnimCurve.new()
    animCurve:reserveKeys( #activeTable)

    for i = 1, #activeTable, 1 do
        animCurve:setKey( i, animationSpeed * (i-1), activeTable[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
    end

    anim = MOAIAnim.new()
    anim:reserveLinks( 1 )
    anim:setLink( 1, animCurve, prop, MOAIProp2D.ATTR_INDEX )
    anim:setMode( MOAITimer.LOOP )
    anim:start()
  end
  
  function penguin:jump()
    local x, y = self.body:getLinearVelocity()
    
    if y == 0 and penguin.preJump == false then 
    
      self:setAnimationTable(prop.preJump)
      print("prejump")
      function jump()
        self.body:applyLinearImpulse(
          0, 
          config.penguinJumpForce / config.unitToMeter
        )
         
        penguin.preJump = false
        self:setAnimationTable(prop.jump)
      end
      
      penguin.preJump = true
      
      local promise = createPromise(0.30, jump)
    end
  end
  
  
  function penguin:setAnimationTable(activeTable)
    self.activeTable = activeTable
    self.stateSwitched = true
  end
  
  penguin:setAnimationTable(penguin.prop.walk)
  
  return penguin
end

function penguinCollisionHandler(phase, fixtureA, fixtureB, arbiter )
  
  if engine:isInFaction(fixtureB:getBody().parent, "snowflakes") then
    engine:deleteGameObject(fixtureB:getBody().parent)
    engine.gameStats.score = engine.gameStats.score + 100
    local updatedScore = tostring(engine.gameStats.score)
    print("score: " .. updatedScore)
    gameUI.hudTexts.scoreCounterText:updateInfo(updatedScore)
  end
  
  if engine:isInFaction(fixtureB:getBody().parent, "iglos") then
    engine:deleteGameObject(fixtureA:getBody().parent)
    engine.gameStats.score = engine.gameStats.score + 200
    local updatedScore = tostring(engine.gameStats.score)
    print("score: " .. updatedScore)
    gameUI.hudTexts.scoreCounterText:updateInfo(updatedScore)
  end
  
end
