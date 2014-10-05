function createLevelSelector()
  
  local levelSelector = {
    headerText = createTextBox(config.prefferedWidth / 2, -100, 512, 64, "Choose a level to play!", 50, false),
    lvl1button = createButton(500, -300, "lvl1"),
    lvl1buttonText = createTextBox(500, -300, 64, 64, "1", 50, true),
    lvl2button = createButton(650, -300, "lvl2"),
    lvl2buttonText = createTextBox(650, -300, 64, 64, "2", 50, true),
    lvl3button = createButton(800, -300, "lvl2"),
    lvl3buttonText = createTextBox(800, -300, 64, 64, "3", 50, true)
    --lvl4button = createButton(x, y, "4", "lvl4")
  }
  
  function levelSelector:start()
    engine:addGameObject(self.headerText)
    engine:addGameObject(self.lvl1button)
    engine:addGameObject(self.lvl1buttonText)
    engine:addGameObject(self.lvl2button)
    engine:addGameObject(self.lvl2buttonText)
    engine:addGameObject(self.lvl3button)
    engine:addGameObject(self.lvl3buttonText)
    --engine:addGameObject(self.lvl4button)
  end

  function levelSelector:destroy()
    
  end
  
  engine.currentLevel = levelSelector
  return levelSelector
end

function createTextBox(xLoc, yLoc, width, height, string, fontSize, whiteColor)
    
    local textBox = createDrawableGameObject(xLoc, yLoc)
  
    local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
    local font = MOAIFont.new()
    font:load( 'assets/fonts/BNMachine.ttf' )
    font:preloadGlyphs( charCodes, 24 )
    
    textBox.prop = MOAITextBox.new()
    textBox.prop:setStyle( newFontStyle( font, fontSize ) )
    textBox.prop:setString( string )
    textBox.prop:spool()
    textBox.prop:setRect(-(width/2), -(height/2), (width/2), (height/2) )
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
    
    local levelButton = engine:loadImageTexture('assets/sprites/ui/EmptyButton.png')
  
    local quad = MOAIGfxQuad2D.new()
    quad:setTexture( levelButton )
    quad:setRect(
      -32, 
      -32, 
      32, 
      32
    )
  
    Button.prop = MOAIProp2D.new()
    Button.prop:setDeck(quad)
    Button.prop:setScl(1.5, 1.5)
    Button.prop:setLoc(
      Button.x, 
      Button.y
    )
    
    return Button
  end