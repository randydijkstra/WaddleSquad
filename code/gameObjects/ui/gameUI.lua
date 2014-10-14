--[[ Create / handle UI here ]]--
function getGameUI()  
  
  local gameUI = createGameObject()
  
  gameUI.name = "gameUI"
  gameUI.hud = {
    score = createTextBox(   
      ((config.prefferedWidth / 10) * 3.5 ), 
      (config.prefferedHeight/11)*-1 + 10, 
      145, 85,
      "Score: \n" .. tostring(engine.gameStats.score),     
      32, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
     ),
     time = createTextBox(
      config.prefferedWidth / 2, 
      (config.prefferedHeight/11)*-1 + 10, 
      220, 95,
      "Time: "..tostring(engine.gameStats.time),
      44, 
      true,
      "assets/sprites/ui/Achtergrond4.png"
    ),
    amountOfPenguinsLeft = createTextBox(   
      ((config.prefferedWidth / 10) * 7) + 1, 
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
      "100",
      32,
      false
     ),
     jumpBoostCost = createTextBox(   
      config.prefferedWidth / 10 * 8.4, 
      (config.prefferedHeight/1.035)*-1,
      100, 38,
      "50",
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
    jumpBoostButton = createButton(
      config.prefferedWidth / 10 * 8, 
      (config.prefferedHeight/1.06) * -1,
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

  if engine.gameStats.penguinCanBeSpawned == true and engine.gameStats.score >= 100 and engine.gameStats.penguinsLeft > 0 then
    penguin = engine:addGameObject(createPenguin(0, -350))
    local sound = engine:playSound("assets/sounds/quack.mp3", 1)
  end
  
  engine.gameStats.penguinCanBeSpawned = false
  local promise = createPromise(1, function()
    engine.gameStats.penguinCanBeSpawned = true 
  end)
end

function jumpBoostCallback()
  
  if engine.gameStats.score >= 50 then
    engine.gameStats.toggleJumpBoostSpawner = true -- not neccesary anymore?
    engine.gameUI.buttons.jumpBoostButton.prop:seekColor(0.6, 0.6, 0.6, 1, 0.2)
    local sound = engine:playSound("assets/sounds/Place.mp3")

    function touchCallback(x,y) 
      x, y = engine.mainLayer:wndToWorld(x, y)

      if engine.currentLevel:rectInBoxes(x-32, y+32, 64, 64, 20) == false then
        engine:addGameObject(createJumpBoost(x - 32, y - 32))
        engine.gameStats.toggleJumpBoostSpawner = false
        engine.gameStats.score = engine.gameStats.score - 50
        engine.gameUI:updateScore(tostring(engine.gameStats.score))
        engine.gameUI.buttons.jumpBoostButton.prop:seekColor(1, 1, 1, 1, 0.2)    
        
        local sound = engine:playSound("assets/sounds/Placing Waddle Squad.mp3")
      else   
        engine.input:setTouchPromise(touchCallback)
        return true
      end
    end

    engine.input:setTouchPromise(touchCallback)
  end
end

function menuCallback()
  engine:loadLevel('levelSelector')
end