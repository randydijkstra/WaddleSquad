function createTextBox(x, y, string, fontSize, width, height, whiteColor)
  local textBox = createDrawableGameObject(x, y)
  table.insert(textBox.factions, "ui")
  table.insert(textBox.factions, "textBoxes")
  
  --create hud text
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
    local fontStyle = MOAITextStyle.new()
    fontStyle:setFont( font )
    fontStyle:setSize( fontSize )
    fontStyle:setColor( 1,1,1,1 )  
    textBox.prop:setStyle(fontStyle)
  end
    
  function textBox:updateInfo(value)
    self.prop:setString(value)
  end
  
  return textBox
end