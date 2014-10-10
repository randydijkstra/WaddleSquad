function createCollisionBox(x, y, width, height)
  local collisionBox = createGameObject()
  table.insert(collisionBox, "boxes")
  
  collisionBox.x = x
  collisionBox.y = y
  collisionBox.width = width
  collisionBox.height = height
  
  collisionBox.body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
  collisionBox.body:setTransform(collisionBox.x, collisionBox.y)
  
  collisionBox.body:addRect(0, 0, width, height)
  
  return collisionBox
end