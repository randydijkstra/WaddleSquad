function createLevelSelector()
  
  local levelSelector = {
    name = "levelSelector",
    headerText = createTextBox(config.prefferedWidth / 2, -100, 700, 64, "Choose a level to play!", 50, false),
    buttons = {
      howToPlayButton = createButton(
        config.prefferedWidth / 2 - 100, 
        (config.prefferedHeight / 1.1) * -1, 
        200, 100, 
        'assets/sprites/ui/Achtergrond3.png',
        howToPlayCallback, 
        "How to play", true, 30
       ),
       muteSoundButton = createButton(
        config.prefferedWidth / 10 * 8.5, 
        (config.prefferedHeight / 7) * -1, 
        120, 60, 
        'assets/sprites/ui/Achtergrond3.png',
        muteCallback, 
        "Mute", true, 25
       )
    },
    highScoresTextBoxes = {}
  }
  
  local levels = config.amountOfLevels -- maybe auto calculate this later or store in config

  for level = 1, levels, 1 do
    local button = createLevelSelectButton(
      config.prefferedWidth / 5 * level + 50, 
      -360,
      level
    )
    levelSelector.buttons[button.id] = button
    
    local highScore = createHighScoreText(
      config.prefferedWidth / 5 * level + 120, 
      -400,
      level
    ) 
    
    table.insert(levelSelector.highScoresTextBoxes, highScore)
  end
  
  function levelSelector:start()
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
  engine:loadLevel(button.levelName)
end

function howToPlayCallback()
  engine:loadLevel("howToPlay")
end

function muteCallback()
  if config.muteSound == false then
    config.muteSound = true
    print("Sound muted")
    engine.currentLevel.buttons.muteSoundButton.textBox:updateInfo("Unmute")
  else
    config.muteSound = false
    print("Sound unmuted")
    engine.currentLevel.buttons.muteSoundButton.textBox:updateInfo("Mute")
  end
end