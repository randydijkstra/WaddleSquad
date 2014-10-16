function createCrossWater(x, y)
  
  local tileDeck = engine:loadTileDeck(
    'assets/sprites/special/whale.png',
    13, 1,
    0, 0, 50, 50
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
  
  crossWater.prop:setScl(2,2)
  
  --local floorFixt = crossWater.body:addRect(0, 0, 50, 50) -- used for gravity and floors
  
  --[[floorFixt:setFilter(config.maskBits.crossWater, config.maskBits.floor)
  local pengFixt = crossWater.body:addRect(10, 0, 64, 56) -- used for penguin coliision
  pengFixt:setFilter(config.maskBits.jumpBoostSensor)
  pengFixt:setSensor()]]--

  crossWater.previousVector = { x = 0, y = 0 }
  crossWater.currentVector = { x = 0, y = 0 }  
  
  return crossWater
end