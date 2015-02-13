function createLevelSelector()
  
  local levelSelector = {
    name = "levelSelector",
    headerText = createTextBox(config.prefferedWidth / 2, -100, 700, 64, "Choose a level to play!", 50, false),
    buttons = {
      howToPlayButton = createButton(
        config.prefferedWidth / 3 * 2 - 100, 
        (config.prefferedHeight / 1.1) * -1, 
        220, 90, 
        'assets/sprites/ui/Achtergrond3.png',
        howToPlayCallback, 
        "How to play", true, 34
      ),
      settingsButton = createButton(
        config.prefferedWidth / 3 - 100, 
        (config.prefferedHeight / 1.1) * -1, 
        220, 90, 
        'assets/sprites/ui/Achtergrond3.png',
        settingsButtonCallback,
        "Settings", true, 34
      ),
      playStoryButton = createButton(
        config.prefferedWidth / 3 * 3 - 100, 
        (config.prefferedHeight / 1.1) * -1, 
        220, 90, 
        'assets/sprites/ui/Achtergrond3.png',
        storyButtonCallback,
        "Story", true, 34
      )
    },
    highScoresTextBoxes = {}
  }
  
  local levels = config.amountOfLevels -- maybe auto calculate this later or store in config
  local rowLength = levels
  local startPosX = (config.prefferedWidth / rowLength) - 32
  local startPosY = -300
  local offset = 50
  
  --[[
  local y = - (math.floor(tileNumber / layer.width) * level.map.tileheight + offsetY)
  layer.width aantal buttons in een rij
  level.map.tileheight hooghte van je rij
  en laat offsetY maar weg
  tilenumber ofc button number
  ]]--
  
  for level = 1, levels, 1 do
     local button = createLevelSelectButton(
      startPosX + ((128 + offset) * ((level - 1) % rowLength)), 
      startPosY - (128 + offset) ,
      level
    )
    levelSelector.buttons[button.id] = button
    
    local highScore = createHighScoreText(
      startPosX + 64 + ((128 + offset) * ((level - 1) % rowLength)), 
      startPosY,
      level
    ) 
    
    table.insert(levelSelector.highScoresTextBoxes, highScore)
  end
  
  function levelSelector:start()
    engine:playMusic('assets/sounds/music/Level Select.ogg', 0.8)
    engine:addGameObject(self.headerText)
    
    for key, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
    
    for key, object in pairs(self.highScoresTextBoxes) do
      engine:addGameObject(object)
    end
  end

  function levelSelector:destroy()
    
    engine:destroyAllObject()
  end
  
  engine.currentLevel = levelSelector
  return levelSelector
end
  
function createLevelSelectButton(x, y, level)
  local button = createButton(x, y, 128, 128, 'assets/sprites/ui/EmptyButton.png', levelSelectButtonCallback, tostring(level), true, 54)
  table.insert(button.factions, "touchables")
  table.insert(button.factions, "ui")
  button.levelName = "level"..level
  
  return button
end

function createHighScoreText(x, y, level)
  local levelName = "lvl"..level
  
  local string = iif(
    engine.storage:get(levelName, "highscores"),
    engine.storage:get(levelName, "highscores"), 
    0
  )
  print("level: "..level.." highscore:"..string)
  
  local text = createTextBox(x, y, 200, 80, "Highscore:\n"..tostring(string), 30)
  
  return text
end
  
function levelSelectButtonCallback(button)
  for key, sound in pairs(engine.cache.sounds) do
    sound:stop()
  end
  
  if(button.levelName == "level1") then
    engine:loadLevel("storySlides")
  else
    engine:loadLevel(button.levelName)    
  end
end

function howToPlayCallback()
  engine:loadLevel("howToPlay")
end

function settingsButtonCallback()
  print("load settings screen")
  engine:loadLevel("settings")
end

function storyButtonCallback()
  engine:loadLevel("storySlides")
end