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
     )
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
    )
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
  function gameUI:updateAmountOfPenguinsLeft(penguinsLeft)
    self.hud.amountOfPenguinsLeft:updateInfo("x "..tostring(penguinsLeft))
  end
  function gameUI:onDestroy()
    engine.uiIsActive = false
  end
  
  engine.uiIsActive = true
  return gameUI
end

function spawnCallback()
  --Some if statements to limit spawn amount
  function callback()
    engine.gameStats.penguinCanBeSpawned = true
  end
  
  if engine.gameStats.penguinCanBeSpawned == true and engine.gameStats.score >= 300 and engine.gameStats.penguinsLeft > 0 then
    penguin = engine:addGameObject(createPenguin(-50, -350))
  else
    print("Ain't gonna spawn no penguin")
  end
  
  engine.gameStats.penguinCanBeSpawned = false
  local promise = createPromise(1.5, callback)
end

function jumpBoostCallback()
  if engine.gameStats.toggleJumpBoostSpawner == false and engine.gameStats.score >= 400 then
    engine.gameStats.toggleJumpBoostSpawner = true
    print('spawn Gunter the icebear')
    engine.gameUI.buttons.jumpBoostButton.prop:seekColor(0.7, 0.7, 0.7, 1, 0.3)
  elseif engine.gameStats.toggleJumpBoostSpawner == true then
    engine.gameStats.toggleJumpBoostSpawner = false
    print('not spawning Gunter the icebear.. :( ')
    engine.gameUI.buttons.jumpBoostButton.prop:seekColor(1, 1, 1, 1, 0.3)
  end
end

function menuCallback()
  
end