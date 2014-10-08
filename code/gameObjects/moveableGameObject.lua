function createMoveableGameObject(x, y, deck, MOAIBox2DBodyType)
  local gameObject = createCollidingGameObject(x, y, deck, MOAIBox2DBodyType)

  table.insert(gameObject.factions, 'moveables') 
  table.insert(gameObject.factions, 'update') 
  
  
  function gameObject:update()
    self.prop:setLoc(self.body:getPosition())
    self.x, self.y = self.body:getPosition()
  end
  
  return gameObject
end