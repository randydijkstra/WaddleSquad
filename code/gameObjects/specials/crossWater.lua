function createCrossWater(x, y)
  
  local tileDeck = engine:loadTileDeck(
    'assets/sprites/special/whale.png',
    13, 1,
    0, 0, 128, 128
  )
  
  local crossWater = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC) 
  
  table.insert(crossWater.factions, 'crossWaters')
  crossWater.name = "crossWater"
  crossWater.animationSpd = 0.07

  crossWater.animTable = {
    preSquirt = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0 },
    squirt = { 11, 12, 13, 0 }
  }
  
  crossWater:setAnimation(crossWater.animTable.preSquirt)
  createPromise( ( #crossWater.animTable.preSquirt -1 ) * crossWater.animationSpd, function()    
    crossWater:setAnimation(crossWater.animTable.squirt)
  end)
  
  local waterFixt = crossWater.body:addRect(0, 64, 128, 128) -- used for gravity and water
  waterFixt:setFilter(config.maskBits.waterBoost, config.maskBits.water)
  
  local waterBoostPlatform = crossWater.body:addPolygon(createSmoothEdgePolygon(-10, 120, 138, 128, 9, 3)) -- used for penguin coliision
  waterBoostPlatform:setFilter(config.maskBits.waterBoostPlatform, config.maskBits.penguin)
  
  local floorFixt = crossWater.body:addRect(0, 0, 120, 128) -- used for floor coliision
  floorFixt:setFilter(config.maskBits.waterBoost, config.maskBits.floor)
  
  return crossWater
end