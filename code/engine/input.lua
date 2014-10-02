--[[--
  This file will handle all inputs so we can treat every device the same.
--]]--

print('controller loaded')

input = {}
input.__index = input

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
          
          print( 'Mouse is down, yo' )
          if engine.currentLevel == splashScreen then
            if splashScreenFinished == true then
              print('Start game!')
              
                engine.mainLayer:removeProp( sblogo )
                engine.mainLayer:removeProp( wslogo )
                engine.mainLayer:removeProp( textBox ) 
             
              levelLoader('level1')
            else
              print('Splashscreen still busy..')
            end
          else
            onTouchJump( MOAIInputMgr.device.pointer:getLoc() )
          end
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
  --print(key)

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
    
    if key == keyBoardTable.i then
      engine.player:jump()
    end
    if key == keyBoardTable.l then
      input.isWalkingRight = true
    end
    if key == keyBoardTable.j then
      input.isWalkingLeft = true
    end
    
  else
    if key == keyBoardTable.l then
      input.isWalkingRight = false
    end
    if key == keyBoardTable.j then
      input.isWalkingLeft = false
    end
  end
  
  engine:activateMoveAbleGameObjects()
end

function onTouchJump( x, y )
  if engine.currentLevel == splashScreen then
    
  else
    print( 'Jump le penguins' )
    for id, penguin in pairs(engine.gameObjects.factions.penguins) do
      penguin:jump()
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
}