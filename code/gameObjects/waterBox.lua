function createWaterBox(x, y, width, height)
  local waterBox = createGameObject()
  table.insert(waterBox.factions, "water")
  
  waterBox.x = x
  waterBox.y = y
  waterBox.width = width
  waterBox.height = height
  
  waterBox.body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
  waterBox.body:setTransform(waterBox.x, waterBox.y)
  
  waterBox.body:addRect(0, 0, width, -height):setFilter(config.maskBits.water)
  
  return waterBox
end