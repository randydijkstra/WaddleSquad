function createLevelSelector()
  
  local levelSelector = {
    name = "levelSelector",
    headerText = createTextBoxTemp(config.prefferedWidth / 2, -100, 700, 64, "Choose a level to play!", 50, false),
    buttons = {
      lvl1button = createButtonTemp(
        (config.prefferedWidth / 8), 
        -360, 
        "level1"
      ),
      lvl2button = createButtonTemp(
        (config.prefferedWidth / 8) * 2, 
        -360, 
        "level2"
      ),
      lvl3button = createButtonTemp(
        (config.prefferedWidth / 8) * 3,
        -360, 
        "level3"
      ),
      lvl4button = createButtonTemp(
        (config.prefferedWidth / 8) * 4, 
        -360,
        "level4"
      )
    },
    buttonTexts = {
      lvl1buttonText = createTextBoxTemp(
        (config.prefferedWidth / 8) + 64, -300, 64, 64, "1", 54, true
      ),
      lvl2buttonText = createTextBoxTemp(
        (config.prefferedWidth / 8) * 2 + 64, -300, 64, 64, "2", 54, true
      ),
      lvl3buttonText = createTextBoxTemp(
        (config.prefferedWidth / 8) * 3 + 64, -300, 64, 64, "3", 54, true
      ),
      lvl4buttonText = createTextBoxTemp(
        (config.prefferedWidth / 8) * 4 + 64, -300, 64, 64, "4", 54, true
      )
    }--[[,
    highScores = {
      lvl1 = createTextBox(
        500, -430, 100, 50, tostring(levelHighScores.lvl1), 40, false
      )
    }]]--
  }
  
  function levelSelector:start()
    engine:addGameObject(self.headerText)
    
    for key, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
    
    for key, object in pairs(self.buttonTexts) do
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

function createTextBoxTemp(xLoc, yLoc, width, height, string, fontSize, whiteColor)
    
    local textBox = createDrawableGameObject(xLoc, yLoc)
    table.insert(textBox.factions, "ui")
    --table.insert(textBox.factions, "touchables")

  
    local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
    local font = MOAIFont.new()
    font:load( 'assets/fonts/BNMachine.ttf' )
    font:preloadGlyphs( charCodes, 24 )
    
    textBox.prop = MOAITextBox.new()
    textBox.prop:setStyle( newFontStyle( font, fontSize ) )
    textBox.prop:setString( string )
    textBox.prop:spool()
    textBox.prop:setRect(-(width/2), -(height/2), (width/2), (height/2))
    textBox.prop:setLoc(
      textBox.x, 
      textBox.y
    )
    textBox.prop:setAlignment(
      MOAITextBox.CENTER_JUSTIFY, 
      MOAITextBox.CENTER_JUSTIFY 
    )
    textBox.prop:setYFlip( true )
    
    if whiteColor == true then
      textBox.prop:setHighlight(1,1,1,1)
    end
    
    return textBox
  end
  
  function createButtonTemp(x, y, levelName)
    local button = createDrawableGameObject(x, y)
    table.insert(button.factions, "touchables")
    table.insert(button.factions, "ui")
    button.levelName = levelName
    
    local xScale = 2
    local yScale = 2
    button.width = 64 * xScale
    button.height = 64 * yScale
    
    local levelButton = engine:loadImageTexture('assets/sprites/ui/EmptyButton.png')
  
    local quad = MOAIGfxQuad2D.new()
    quad:setTexture( levelButton )
    quad:setRect(
      0, 0, 64, 64
    )
  
    button.prop = MOAIProp2D.new()
    button.prop:setDeck(quad)
    button.prop:setScl(xScale, yScale)
    button.prop:setLoc(
      button.x, 
      button.y
    )
    
    --Button.prop:setColor ( 0, 0, 0, 0 )
    
    function button:onTouch(x,y)
      print("button was touched in touch")
      engine:loadLevel(self.levelName)
    end
    
    return button
  end