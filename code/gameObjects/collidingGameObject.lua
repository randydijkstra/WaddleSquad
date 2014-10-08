function createCollidingGameObject(x, y, deck, MOAIBox2DBodyType)
  --[[
    MOAIBox2DBody.STATIC | MOAIBox2DBody.DYNAMIC | MOAIBox2DBody Kinetic
  --]]
  
  local collidingGameObject = createDrawableGameObject(x, y, deck)
  
  local body = engine.box2DWorld:addBody( MOAIBox2DBodyType )
  body:setTransform(collidingGameObject.x, collidingGameObject.y)
  
  collidingGameObject.body = body
  
  return collidingGameObject
end