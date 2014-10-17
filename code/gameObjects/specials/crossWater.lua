function createCrossWater(x, y)
  
  local tileDeck = engine:loadTileDeck(
    'assets/sprites/special/whale.png',
    13, 1,
    0, 0, 128, 128
  )
  
  local crossWater = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC) 
  
  table.insert(crossWater.factions, 'crossWaters')
  crossWater.name = "crossWater"

  local animTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0}
  
  animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #animTable)

  for i = 1, #animTable, 1 do
    animCurve:setKey( i, 0.1 * (i-1), animTable[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end

  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, crossWater.prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()
  
  local waterFixt = crossWater.body:addRect(0, 0, 128, 128) -- used for gravity and floors
  waterFixt:setFilter(config.maskBits.waterBoost, config.maskBits.water)
  
  local sensorFixt = crossWater.body:addRect(0, 0, 128, 128) -- used for penguin coliision
  sensorFixt:setFilter(config.maskBits.waterBoostSensor)
  sensorFixt:setSensor()

  crossWater.previousVector = { x = 0, y = 0 }
  crossWater.currentVector = { x = 0, y = 0 }  
  
  return crossWater
end