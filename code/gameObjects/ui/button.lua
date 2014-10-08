function createButton(x, y, width, height, imagePath, callback, text, isTextWhite, fontSize)
  --create button object
  local button = createDrawableGameObject(x, y)
  button.callback = callback
  table.insert(button.factions, "touchables")
  table.insert(button.factions, "ui")
  table.insert(button.factions, "buttons")

  local xScale = 1.5
  local yScale = 1.5
  button.width = width * xScale
  button.height = height * yScale
    
  local buttonTexture = engine:loadImageTexture(imagePath)
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( buttonTexture )
  quad:setRect(
    0, 0, width, height 
  )

  button.prop = MOAIProp2D.new()
  button.prop:setDeck(quad)
  button.prop:setScl(xScale, yScale)
  button.prop:setLoc(
    button.x, 
    button.y
  )
  
  if text then
    if fontSize == nil then
      fontSize = self.width / 2 -- should be improved
    end

    button.textBox = createTextBox(x+width/2, y+height/2, text, fontSize, self.width, self.height, isTextWhite)
  end
  
  function button:onAdd()
    if self.textBox then
      engine:addGameObject(self.textBox)
    end
  end
  
  function button:onTouch(x, y)
    self.callback()
  end
  
  return button
end