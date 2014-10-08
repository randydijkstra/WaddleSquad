--[[--
  This file will handle all inputs so we can treat every device the same.
--]]--

print('controller loaded')

input = {}
input.__index = input


canTouch = true -- used to prevent  clickign trough buttons

function createInput()
  
  local input = createGameObject()
  table.insert(input.factions,"update")
  
  if(MOAIInputMgr.device.keyboard) then
    print("Keyboard")
    MOAIInputMgr.device.keyboard:setCallback( handleKeyboardInput )
  else

  end

  if MOAIInputMgr.device.pointer then
    -- Ok, er is een muis
    MOAIInputMgr.device.mouseLeft:setCallback(
      function( isMouseDown )
        if( isMouseDown ) then
          
          onGeneralTouch(MOAIInputMgr.device.pointer:getLoc())
          
          if canTouch and engine.currentLevel.name == "splashScreen" then
            if config.splashScreenFinished == true then
              print('Start game!')
             
              engine:loadLevel('levelSelector')
            else
              print('Splashscreen still busy..')
            end
          elseif canTouch and engine.inLevel == true then
            onInLevelTouch( engine.mainLayer:wndToWorld( MOAIInputMgr.device.pointer:getLoc() ) )
          elseif canTouch and engine.currentLevel.name == "levelSelector" then
            print("Choose a level!")
            onLevelSelectorTouch( engine.mainLayer:wndToWorld(MOAIInputMgr.device.pointer:getLoc()) )
          end
          
          canTouch = true
        end
      end
    )
  else
    -- Er is een touch
    MOAIInputMgr.device.touch:setCallback(
      function( eventType, idx, x, y, tapCount )
        if tapCount > 1 then
          -- Niks doen
        elseif eventType == MOAITouchSensor.TOUCH_DOWN then
          print( 'GIT YER GRIMY FINGERS OFF MAH SCREEN BOYO' )
          onTouch( x, y )
        end
      end
    )
  end


  
  function input:update()
    --engine.penguin.body:setActive(true)
  end
  
  input.isWalkingRight = false;
  input.isWalkingLeft = false;
  
  return input
end

function handleKeyboardInput(key, down)
  
  if down then
    --gravity
    if key == keyBoardTable.d then
      engine.box2DWorld:setGravity(-config.gravityY / config.unitToMeter, config.gravityX)
    end 
    if key == keyBoardTable.a then
      engine.box2DWorld:setGravity(config.gravityY / config.unitToMeter, config.gravityX)
    end  
    if key == keyBoardTable.s then
      engine.box2DWorld:setGravity(config.gravityX, config.gravityY / config.unitToMeter)
    end  
    if key == keyBoardTable.w then
      engine.box2DWorld:setGravity(config.gravityX, -config.gravityY / config.unitToMeter)
    end
    
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
  end
  
end

function onGeneralTouch(x, y)
  -- gets called on any touch

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
      canTouch = false
      touchable:onTouch(layerX, layerY)
    end
  end
  
end

function onInLevelTouch( x, y )
  for id, penguin in pairs(engine.gameObjects.factions.penguins) do
    penguin:jump()
  end
end

function onLevelSelectorTouch( x, y )
  --for name, button in pairs(engine.currentLevel.buttons) do
  --  if rectContainsPoint(button.x, button.y, button.width, button.height, x, y)
 -- end
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
  zero=58,
}