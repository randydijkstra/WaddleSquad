function createTextBox(x, y, width, height, string, fontSize, whiteColor, background)
  local textBox = createDrawableGameObject(x, y)
  table.insert(textBox.factions, "ui")
  table.insert(textBox.factions, "textBoxes")
  
  local fontStyle = engine:loadFontStyle( 'assets/fonts/BNMachine.ttf', fontSize )
  if whiteColor then fontStyle:setColor( 1,1,1,1 ) end
 
  textBox.prop = MOAITextBox.new()
  textBox.prop:setStyle( fontStyle )
  
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
    
  if background then
    local backgroundObject = createDrawableGameObject(
      textBox.x - width / 2, 
      textBox.y - height / 2
    )
    table.insert(backgroundObject.factions, "ui")
    table.insert(backgroundObject.factions, "textBoxBackgrounds")
    
    backgroundObject.width = width
    backgroundObject.height = height
    
    backgroundObject.prop = MOAIProp2D.new()
    backgroundObject.prop:setDeck( engine:loadQuad(
      background, 
      backgroundObject.width, 
      backgroundObject.height
    ))
    backgroundObject.prop:setLoc(backgroundObject.x, backgroundObject.y)
    
    textBox.background = backgroundObject
    engine:addGameObject(textBox.background) -- Currently here for z-index reasons
  end
    
  function textBox:updateInfo(value)
    self.prop:setString(value)
  end
  
  return textBox
end