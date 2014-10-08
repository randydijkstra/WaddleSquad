function createMoveableGameObject(x, y, deck, MOAIBox2DBodyType)
  local gameObject = createCollidingGameObject(x, y, deck, MOAIBox2DBodyType)

  table.insert(gameObject.factions, 'moveables') 
  table.insert(gameObject.factions, 'update') 
  
  
  gameObject.previousVector = { x = 0, y = 0 }
  gameObject.currentVector = { x = 0, y = 0 }
  
  return gameObject
end