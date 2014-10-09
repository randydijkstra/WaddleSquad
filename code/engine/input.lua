--[[--
  This file will handle all inputs so we can treat every device the same.
--]]--

print('controller loaded')

canTouch = true -- used to prevent  clickign trough buttons

function createInput()
  
  local input = createGameObject()

  input.states = {
    locked = false, -- when nothing is supposed to be happening
    triggered = false, -- when a button has been triggered (resets after the loop)
    draggin = false -- when something is being dragged
  }
  
  input.touchPromise = nil-- This will be called when set and removed right after
  
  if MOAIInputMgr.device.keyboard then
    print("Keyboard")
    MOAIInputMgr.device.keyboard:setCallback( handleKeyboardInput )
  end

  if MOAIInputMgr.device.pointer then
    -- Ok, er is een muis
    MOAIInputMgr.device.mouseLeft:setCallback(
      function( isMouseDown )
        if input.states.locked ~= false then
          if( isMouseDown ) then
            input:onGeneralTouch(MOAIInputMgr.device.pointer:getLoc()) 
          end
          input.states.triggered = false
        end
      end
    )
  else
    -- Er is een touch
    MOAIInputMgr.device.touch:setCallback(
      function( eventType, idx, x, y, tapCount )
        if input.states.locked ~= false then
          if tapCount > 1 then
            -- Niks doen
          elseif eventType == MOAITouchSensor.TOUCH_DOWN then
            input:onGeneralTouch(x,y)
          end
          input.states.triggered = false
        end
      end
    )
  end

  function input:onGeneralTouch(x, y)
    -- gets called on any touch

    if self.touchPromise then
      self.touchPromise()
      self.touchPromise = nil
      self.states.triggered = true
    end

    if self.states.triggered == false then
      for id, touchable in pairs(engine.gameObjects.factions.touchables) do
        
        -- Would have been awesome but because of multiply returns this is impoissble (even with the iff(cond,a,b) function
        --local layerX, layerY = ( isStringInTable(touchable.factions, 'ui') and engine.uiLayer:wndToWorld(x,y) or engine.mainLayer:wndToWorld(x,y) )
        
        local layerX, layerY
        if engine:isInFaction(touchable, 'ui') then
          layerX, layerY = engine.uiLayer:wndToWorld(x,y)
        else
          layerX, layerY = engine.mainLayer:wndToWorld(x,y)
        end
        
        if pointInsideRect(touchable.x, touchable.y, touchable.width, touchable.height, layerX, layerY) then
          self.states.triggered = true
          touchable:onTouch(layerX, layerY)
          break
        end
      end
    end
    
    if engine.inLevel and self.states.triggered == false then
      self:onInLevelTouch( engine.mainLayer:wndToWorld( x, y ) )
    end
  end

  function input:onInLevelTouch( x, y )
    if engine.gameStats.toggleJumpBoostSpawner == true then
      engine:addGameObject(createJumpBoost(x, y))
      engine.gameStats.toggleJumpBoostSpawner = false
      engine.gameStats.score = engine.gameStats.score - 400
      engine.gameUI.buttons.jumpBoostButton.prop:seekColor(1, 1, 1, 1, 0.3)
    else
      for id, penguin in pairs(engine.gameObjects.factions.penguins) do
        penguin:jump()
      end
    end
  end

  function input:setTouchPromise(callback)
    self.touchPromise = callback
  end
  
  input.isWalkingRight = false;
  input.isWalkingLeft = false;
  
  return input
end

function handleKeyboardInput(key, down)
  
  if down then    
    if key == keyBoardTable.one then
      engine:loadLevel("level1")
    end
    
    if key == keyBoardTable.two then
      engine:loadLevel("level2")
    end
    
    if key == keyBoardTable.three then
      engine:loadLevel("level3")
    end
    
    if key == keyBoardTable.four then
      engine:loadLevel("level4")
    end
    
     if key == keyBoardTable.zero then
      engine:loadLevel("levelSelector")
    end
  end
  
end

keyBoardTable = { 
  w=119, 
  d=100, 
  s=115,
  a=97,
  space=32,
  i=105,
  l=108,
  k=107,
  j=106,
  one=49,
  two=50,
  three=51,
  four=52,
  five=53,
  six=54,
  seven=55,
  eight=56,
  nine=57,
  zero=48,
}
