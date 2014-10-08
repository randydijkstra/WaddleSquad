function createDrawableGameObject(x, y, deck)
  local drawableGameObject = createGameObject()
  table.insert(drawableGameObject.factions,'drawables')
  
  drawableGameObject.x = x
  drawableGameObject.y = y
  
  local prop = MOAIProp2D.new()
  prop:setDeck(deck)
  prop:setLoc(drawableGameObject.x, drawableGameObject.y)

  drawableGameObject.prop = prop

  return drawableGameObject
end