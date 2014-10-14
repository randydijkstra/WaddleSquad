function createButton(x, y, width, height, imagePath, callback, text, isTextWhite, fontSize)
  --create button object
  local button = createDrawableGameObject(x, y)
  button.callback = callback
  table.insert(button.factions, "touchables")
  table.insert(button.factions, "ui")
  table.insert(button.factions, "buttons")

  button.width = width
  button.height = height
  button.textBox = nil
      
  local buttonTexture = engine:loadImageTexture(imagePath)
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( buttonTexture )
  quad:setRect(
    0, 0, width, height 
  )

  button.prop = MOAIProp2D.new()
  button.prop:setDeck(quad)
  button.prop:setLoc(
    button.x, 
    button.y
  )
  
  if text then
    if fontSize == nil then
      fontSize = self.width / 2 -- should be improved
    end

    button.textBox = createTextBox(button.x+width/2, button.y+height/2, button.width, button.height, text, fontSize, isTextWhite)
  end
  
  function button:onAdd()
    if self.textBox then
      engine:addGameObject(self.textBox)
    end
  end
  
  function button:onTouch(x, y)
    self.callback(self)
  end
  
  return button
end