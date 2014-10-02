function createDrawableGameObject(x, y)
  local drawableGameObject = createGameObject()
  
  drawableGameObject.draw = true
  drawableGameObject.x = x
  drawableGameObject.y = y
    
  table.insert(drawableGameObject.factions,'drawables')

  return drawableGameObject
end