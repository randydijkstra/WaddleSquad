function createMoveableGameObject(x, y)
  local gameObject = createDrawableGameObject(x, y)
  
  table.insert(gameObject.factions, 'moveable')
  
  gameObject.spdX = 0;
  gameObject.spdY = 0;
  gameObject.weight = 1;
  
  return gameObject
end