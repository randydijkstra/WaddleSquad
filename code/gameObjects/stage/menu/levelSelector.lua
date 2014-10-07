function createLevelSelector()
  
  local levelSelector = {
    name = "levelSelector",
    headerText = createTextBox(config.prefferedWidth / 2, -100, 700, 64, "Choose a level to play!", 50, false),
    buttons = {
      lvl1button = createButton(
        (config.prefferedWidth / 8), 
        -360, 
        "level1"
      ),
      lvl2button = createButton(
        (config.prefferedWidth / 8) * 2, 
        -360, 
        "level2"
      ),
      lvl3button = createButton(
        (config.prefferedWidth / 8) * 3,
        -360, 
        "level3"
      ),
      lvl4button = createButton(
        (config.prefferedWidth / 8) * 4, 
        -360,
        "level4"
      )
    },
    buttonTexts = {
      lvl1buttonText = createTextBox(
        (config.prefferedWidth / 8) + 64, -300, 64, 64, "1", 54, true
      ),
      lvl2buttonText = createTextBox(
        (config.prefferedWidth / 8) * 2 + 64, -300, 64, 64, "2", 54, true
      ),
      lvl3buttonText = createTextBox(
        (config.prefferedWidth / 8) * 3 + 64, -300, 64, 64, "3", 54, true
      ),
      lvl4buttonText = createTextBox(
        (config.prefferedWidth / 8) * 4 + 64, -300, 64, 64, "4", 54, true
      )
    },
    highScores = {
      lvl1 = createTextBox(
        500, -430, 100, 50, tostring(levelHighScores.lvl1), 40, false
      )
    }
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

function createTextBox(xLoc, yLoc, width, height, string, fontSize, whiteColor)
    
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
  
  function createButton(x, y, levelName)
    Button = createDrawableGameObject(x, y)
    table.insert(Button.factions, "touchables")
    table.insert(Button.factions, "ui")
    Button.levelName = levelName
    
    xScale = 2
    yScale = 2
    Button.width = 64 * xScale
    Button.height = 64 * yScale
    
    local levelButton = engine:loadImageTexture('assets/sprites/ui/EmptyButton.png')
  
    local quad = MOAIGfxQuad2D.new()
    quad:setTexture( levelButton )
    quad:setRect(
      0, 0, 64, 64
    )
  
    Button.prop = MOAIProp2D.new()
    Button.prop:setDeck(quad)
    Button.prop:setScl(xScale, yScale)
    Button.prop:setLoc(
      Button.x, 
      Button.y
    )
    
    --Button.prop:setColor ( 0, 0, 0, 0 )
    
    function Button:onTouch(x,y)
      print("button was touched in touch")
      engine:loadLevel(self.levelName)
    end
    
    return Button
  end