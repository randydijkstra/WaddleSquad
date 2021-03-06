--[[ Create / handle UI here ]]--
function getGameUI()  
  
  local gameUI = createGameObject()
  
  gameUI.name = "gameUI"
  gameUI.hud = {
    score = createTextBox(   
      ((config.prefferedWidth / 10) * 6.5), 
      (config.prefferedHeight/11)*-1 + 10, 
      145, 85,
      "Score: \n" .. tostring(engine.gameStats.score),     
      32, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
     ),
     time = createTextBox(
      config.prefferedWidth / 10 * 5, 
      (config.prefferedHeight/11)*-1 + 10, 
      220, 95,
      "Time: "..tostring(engine.gameStats.time),
      44, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
    ),
    amountOfPenguinsLeft = createTextBox(   
      ((config.prefferedWidth / 10) * 3) + 1, 
      (config.prefferedHeight/11)*-1 + 10,
      275, 85,
      "Penguins left: " .. tostring(engine.gameStats.penguinsLeft)..
      "\nPenguins arrived: " .. tostring(engine.gameStats.penguinsFinished),
      26,
      true,
      "assets/sprites/ui/Achtergrond4.png"
     ),
     penguinCost = createTextBox(   
      config.prefferedWidth / 10 * 9.4, 
      (config.prefferedHeight/1.035)*-1,
      100, 38,
      tostring(config.penguinSpawnCost),
      32,
      false
     ),
     jumpBoostCost = createTextBox(   
      config.prefferedWidth / 10 * 8.4, 
      (config.prefferedHeight/1.035)*-1,
      100, 38,
      tostring(config.jumpBoostCost),
      32,
      false
     ),
     crossWaterBoostCost = createTextBox(   
      config.prefferedWidth / 10 * 7.4, 
      (config.prefferedHeight/1.035)*-1,
      100, 38,
      tostring(config.crossWaterCost),
      32,
      false
     )
  } 
  gameUI.buttons = {
    penguinSpawnButton = createButton(
       config.prefferedWidth / 10 * 9,  
      (config.prefferedHeight/1.06) * -1,
      96, 96,
      "assets/sprites/ui/Spawn.png", 
      spawnCallback
    ),
    jumpBoostButton = createSpawnButton(
      config.prefferedWidth / 10 * 8, (config.prefferedHeight/1.06) * -1,
      96, 96,
      "assets/sprites/ui/Jumping.png", 
      config.jumpBoostCost, 
      64, 64,
      "assets/sounds/Place.wav", "assets/sounds/Placing Waddle Squad.wav",
      function(x, y) engine:addGameObject(createJumpBoost(x - 32, y - 32)) end,
      20
    ),
    crossWaterButton = createSpawnButton(
      config.prefferedWidth / 10 * 7, (config.prefferedHeight/1.06) * -1,
      96, 96,
      "assets/sprites/ui/Crossing-Water.png",
      config.crossWaterCost, 
      128, 128,
      "assets/sounds/Place.wav", "assets/sounds/Placing Waddle Squad.wav",
      function(x, y)  
        x, y = snapToGrid(x-64, y -32, 64, 64, false, true, false)    
        engine:addGameObject(createCrossWater(x+1, y))  
      end,
      30
    ),
    menuButton = createButton(
      config.prefferedWidth / 10 * 0.1, 
      (config.prefferedHeight/7.5)*-1,
      82, 82,
      "assets/sprites/ui/Pause.png", 
      menuCallback
    )
  }
  
  function gameUI:start()
    --[[for keys, object in pairs(self.hud) do
      engine:addGameObject(object)
    end]]--
    --[[for keys, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end]]--
    
    engine:addGameObject(self.hud.score)
    engine:addGameObject(self.hud.time)
    engine:addGameObject(self.hud.jumpBoostCost)
    engine:addGameObject(self.hud.penguinCost)
    engine:addGameObject(self.hud.amountOfPenguinsLeft)
    engine:addGameObject(self.buttons.penguinSpawnButton)
    engine:addGameObject(self.buttons.jumpBoostButton)
    engine:addGameObject(self.buttons.menuButton)
    
    if engine.currentLevel.name ~= "lvl1" 
    and engine.currentLevel.name ~= "lvl2" 
    and engine.currentLevel.name ~= "lvl3" then
      engine:addGameObject(self.buttons.crossWaterButton)
      engine:addGameObject(self.hud.crossWaterBoostCost)
    end
  end  
  
  --Functions to update the huds
  function gameUI:updateScore(score)
    self.hud.score:updateInfo("Score: \n"..score)
  end
  function gameUI:updateTime(time)
    self.hud.time:updateInfo("Time: "..tostring(time))
  end
  function gameUI:updateAmountOfPenguinsLeft(penguinsLeft)
    self.hud.amountOfPenguinsLeft:updateInfo(tostring(penguinsLeft))
  end
  function gameUI:updateAmountOfPenguinsFinished(penguinsFinished)
    self.hud.amountOfPenguinsFinished:updateInfo(tostring(penguinsFinished))
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

  if engine.gameStats.penguinCanBeSpawned == true and engine.gameStats.score >= config.penguinSpawnCost and engine.gameStats.penguinsLeft > 0 then
    local currentLevelName = engine.currentLevel.name
    local pos = config.penguinStartPosition[currentLevelName]
    --local ypos = config.penguinStartPosition.currentLevelName.y
    print("currentlevelname: "..currentLevelName .." x & y pos: ".. pos.x .. "/" .. pos.y)
    penguin = engine:addGameObject(createPenguin(pos.x, pos.y))
    local sound = engine:playSound("assets/sounds/quack.wav", 1)
  end
  
  engine.gameStats.penguinCanBeSpawned = false
  local promise = createPromise(1, function()
    engine.gameStats.penguinCanBeSpawned = true 
  end)
end

function menuCallback()
  engine:loadLevel('levelSelector')
end