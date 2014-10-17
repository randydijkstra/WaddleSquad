function createJumpBoost(x, y)
  
  local tileDeck = engine:loadTileDeck(
    'assets/sprites/special/bear.png',
    6, 1,
    0, 0, 64, 64
  )
  
  local jumpBoost = createMoveableGameObject(x, y, tileDeck, MOAIBox2DBody.DYNAMIC) 
  
  table.insert(jumpBoost.factions, 'jumpBoosts')
  jumpBoost.name = "jumpBoost"
  jumpBoost.animationSpd = 0.4

  jumpBoost.animTable = { idle = { 1, 2, 3, 4, 5, 6, 0} }
  jumpBoost:setAnimation( jumpBoost.animTable.idle )
  
  local floorFixt = jumpBoost.body:addRect(0, 0, 64, 64) -- used for gravity and floors
  floorFixt:setFilter(config.maskBits.jumpBoost, config.maskBits.floor)
  local pengFixt = jumpBoost.body:addRect(10, 0, 64, 56) -- used for penguin coliision
  pengFixt:setFilter(config.maskBits.jumpBoostSensor)
  pengFixt:setSensor()

  jumpBoost.previousVector = { x = 0, y = 0 }
  jumpBoost.currentVector = { x = 0, y = 0 }  
  
  return jumpBoost
end