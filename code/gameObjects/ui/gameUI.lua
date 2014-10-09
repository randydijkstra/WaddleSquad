--[[ Create / handle UI here ]]--
function getGameUI()  
  
  local gameUI = createGameObject()
  
  gameUI.name = "gameUI"
  gameUI.hud = {
    score = createTextBox(   
      config.prefferedWidth / 10 * 4 + 32, (config.prefferedHeight/11)*-1, 
      150, 90,
      "Score: \n" .. engine.gameStats.score,     
      32, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
     ),
     time = createTextBox(
      config.prefferedWidth / 10 * 5 + 64, (config.prefferedHeight/11)*-1, 
      128, 64,
      tostring(engine.gameStats.time),
      50, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
    ),
    amountOfPenguinsLeft = createTextBox(   
      config.prefferedWidth / 10 * 1.75, 
      (config.prefferedHeight/1.1) * -1,
      140, 90,
      "x " .. engine.gameStats.penguinsLeft,     
      60
     )--[[,
     amountOfPenguinsFinished = createTextBox(   
      config.prefferedWidth / 10 * 9, 
      (config.prefferedHeight/1.3) * -1,
      100, 50,
      "x " .. engine.gameStats.penguinsFinished,     
      30
     )]]--
  } 
  gameUI.buttons = {
    penguinSpawnButton = createButton(
      config.prefferedWidth / 10 * 0.5, 
      (config.prefferedHeight/1.03) * -1,
      96, 96,
      "assets/sprites/ui/Spawn.png", 
      spawnCallback
    ),
    jumpBoostButton = createButton(
      config.prefferedWidth / 10 * 9, 
      (config.prefferedHeight/1.03) * -1,
      96, 96,
      "assets/sprites/ui/Jumping.png", 
      jumpBoostCallback
    ),
    menuButton = createButton(
      config.prefferedWidth / 10 * 0.25, 
      (config.prefferedHeight/ 9) * -1,
      64, 64,
      "assets/sprites/ui/Pause.png", 
      menuCallback
    )
  }
  
  function gameUI:start()
    for keys, object in pairs(self.hud) do
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
  end
  
  function gameUI:updateScore(score)
    self.hud.score:updateInfo("Score: \n"..score)
  end
  function gameUI:updateTime(time)
    self.hud.time:updateInfo(tostring(time))
  end
  function gameUI:updateAmountOfPenguinsLeft(penguinsLeft)
    self.hud.amountOfPenguinsLeft:updateInfo("x "..tostring(penguinsLeft))
  end
  function gameUI:updateAmountOfPenguinsFinished(penguinsFinished)
    self.hud.amountOfPenguinsFinished:updateInfo("x "..tostring(penguinsFinished))
  end
  
  function gameUI:completeScreen(win, score)
    
    local text = iif(win,"LEVEL COMPLETE !\nFinal score: ", "GAME OVER !\nFinal score: ")
    engine:addGameObject(createTextBox(  
      config.prefferedWidth / 2, (config.prefferedHeight/2)*-1, 
      900, 300,
      text .. score,
      60, 
      false
    ))
    
    engine.input.locked = false  
    createPromise(2, function()
        
      engine.input:setTouchPromise(function()
        engine:loadLevel('levelSelector')
      end)
        
      engine.input.locked = false  
    end) 
  
  end
  
  
  function gameUI:onDestroy()
    engine.uiIsActive = false
  end
  
  engine.uiIsActive = true
  
  return gameUI
end

function spawnCallback()

  --if engine.gameStats.penguinCanBeSpawned == true and engine.gameStats.score >= 300 and engine.gameStats.penguinsLeft > 0 then
  if engine.gameStats.penguinCanBeSpawned == true and engine.gameStats.penguinsLeft > 0 then
    penguin = engine:addGameObject(createPenguin(-50, -350))
  end
  
  engine.gameStats.penguinCanBeSpawned = false
  local promise = createPromise(1.5, function()
    engine.gameStats.penguinCanBeSpawned = true 
  end)
end

function jumpBoostCallback()
  engine.gameStats.toggleJumpBoostSpawner = true -- not neccesary anymore?
  engine.gameUI.buttons.jumpBoostButton.prop:seekColor(0.7, 0.7, 0.7, 1, 0.3)
  
  engine.input:setTouchPromise(function(x, y)
    x, y = engine.mainLayer:wndToWorld(x, y)
    engine:addGameObject(createJumpBoost(x - 32, y - 32))
    engine.gameStats.toggleJumpBoostSpawner = false
    engine.gameStats.score = engine.gameStats.score - 400
    engine.gameUI.buttons.jumpBoostButton.prop:seekColor(1, 1, 1, 1, 0.3)
  end)
  
end

function menuCallback()
  engine:loadLevel('levelSelector')
end