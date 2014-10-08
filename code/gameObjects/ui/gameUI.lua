--[[ Create / handle UI here ]]--
function getGameUI()  
  
  local gameUI = createGameObject()
  
  gameUI.name = "gameUI"
  gameUI.hud = {
    score = createTextBox(   
      config.prefferedWidth / 11, (config.prefferedHeight/1.105)*-1, 
      156, 92,
      "Score: \n" .. engine.gameStats.score,     
      32, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
     ),
     time = createTextBox(
      config.prefferedWidth / 2, (config.prefferedHeight/11)*-1, 
      128, 64,
      tostring(engine.gameStats.time),
      50, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
    )
  } 
  gameUI.buttons = {
    penguinSpawnButton = createButton(
      config.prefferedWidth / 10 * 8, (config.prefferedHeight/1.03) * -1,
      96, 96,
      "assets/sprites/ui/Spawn.png", 
      spawnCallback
    )
    --placeJumpBoostButton = createGameUIButton(x, y, path, jumpBoostCallback),
    --menuButton = createGameUIButton(x, y, path, menuCallback)
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
  
  function gameUI:onDestroy()
    engine.uiIsActive = false
  end
  
  engine.uiIsActive = true
  return gameUI
end

function spawnCallback()
  --Some if statements to limit spawn amount
  penguin = engine:addGameObject(createPenguin(-50, -350))
end

function menuCallback()
  
end

function jumpBoostCallback()
  
end