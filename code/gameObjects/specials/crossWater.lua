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
  
  
  local waterFixt = crossWater.body:addRect(0, 0, 128, 128) -- used for gravity and floors
  waterFixt:setFilter(config.maskBits.waterBoost, config.maskBits.water)
  
  local sensorFixt = crossWater.body:addRect(0, 0, 128, 128) -- used for penguin coliision
  sensorFixt:setFilter(config.maskBits.waterBoostSensor)
  sensorFixt:setSensor()  
  
  local floorFixt = crossWater.body:addRect(0, 0, 128, 128) -- used for penguin coliision
  sensorFixt:setFilter(config.maskBits.waterBoost, config.maskBits.floor)
  sensorFixt:setSensor()

  crossWater.previousVector = { x = 0, y = 0 }
  crossWater.currentVector = { x = 0, y = 0 }  
  
  return crossWater
end