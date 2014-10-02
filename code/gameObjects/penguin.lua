function createPenguin(x, y)
  local penguin = createMoveableGameObject(x, y)
  
  table.insert(penguin.factions, 'penguins')
  table.insert(penguin.factions, 'update')
  
  spritePath = 'assets/sprites/penguin/'
  
  local stateSwitched = false
  
  penguin.preJump = false -- boolean to check if penguin is prejumping so we disalow uber jump
  
  
  tileDeck = MOAITileDeck2D.new()
  tileDeck:setTexture(spritePath .. "penguinspreadsheet.png" )
  tileDeck:setSize( 8, 7 ) -- Hier geve men aan hoeveel rijen en kolommen de   sheet heeft
  tileDeck:setRect( -32, -32, 32, 32 )
 
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
  body:addRect(-24, -32, 24, 16):setFriction( config.penguinFriction )
  
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
    
    self.body:applyForce(10, 0)
    -- This can and porabply be linked automaticly
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
          config.penguinForceY / config.unitToMeter
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