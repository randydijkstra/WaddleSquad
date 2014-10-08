function createTextBox(x, y, width, height, string, fontSize, whiteColor)
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
    
  function textBox:updateInfo(value)
    self.prop:setString(value)
  end
  
  return textBox
end