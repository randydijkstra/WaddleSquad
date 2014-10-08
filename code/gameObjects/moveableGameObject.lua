function createMoveableGameObject(x, y)
  local gameObject = createDrawableGameObject(x, y)
 
  table.insert(gameObject.factions, 'moveables')
  
  return gameObject
end