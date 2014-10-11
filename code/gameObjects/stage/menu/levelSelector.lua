function createLevelSelector()
  
  local levelSelector = {
    name = "levelSelector",
    headerText = createTextBox(config.prefferedWidth / 2, -100, 700, 64, "Choose a level to play!", 50, false),
    buttons = {}
    --[[,
    highScores = {
      lvl1 = createTextBox(
        500, -430, 100, 50, tostring(levelHighScores.lvl1), 40, false
      )
    }]]--
  }
  
  local levels = config.amountOfLevels -- maybe auto calculate this later or store in config

  for level = 1, levels, 1 do
    local button = createLevelSelectButton(
      200 * level + 100, 
      -360,
      level
    )
    levelSelector.buttons[button.id] = button
  end
  
  function levelSelector:start()
    engine:addGameObject(self.headerText)
    
    for key, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
    
    --[[for key, object in pairs(self.highScores) do
      engine:addGameObject(object)
    end]]-- highscore feature to implemented later!
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
  
  function levelSelectButtonCallback(button)
    engine:loadLevel(button.levelName)
  end
  