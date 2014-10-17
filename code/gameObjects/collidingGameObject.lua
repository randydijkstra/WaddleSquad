function createCollidingGameObject(x, y, deck, MOAIBox2DBodyType)
  --[[
    MOAIBox2DBody.STATIC | MOAIBox2DBody.DYNAMIC | MOAIBox2DBody Kinetic
  --]]
  
  local collidingGameObject = createDrawableGameObject(x, y, deck)
  table.insert(collidingGameObject.factions, 'collisions')
  
  local body = engine.box2DWorld:addBody( MOAIBox2DBodyType )
  body:setTransform(collidingGameObject.x, collidingGameObject.y)
  
  collidingGameObject.body = body
  
  function collidingGameObject:setBodyType(MOAIBox2DBodyType)
    -- work around for moai not binding the body:setType() in lua
    -- only works when the gameObject has an setFixture function becuase we can't get all fixtures from a body
    local x, y = self.body:getPosition()
    self.body:destroy()
    self.body = engine.box2DWorld:addBody( MOAIBox2DBodyType )
    self.body:setTransform(x, y)
    self.body.parent = self
    
    self:setFixtures()
  end
  
  return collidingGameObject
end