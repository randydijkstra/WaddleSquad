function createJumpBoost(x, y)
  
  local tileDeck = engine:loadTileDeck(
    'assets/sprites/special/bear.png',
    6, 1,
    0, 0, 64, 64
  )
  
  local jumpBoost = createCollidingGameObject(x, y, tileDeck, MOAIBox2DBody.STATIC)

  table.insert(jumpBoost.factions, 'jumpBoosts')
  jumpBoost.name = "jumpBoost"
  
  local animTable = {1, 2, 3, 4, 5, 6, 0}
  
  animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #animTable)

  for i = 1, #animTable, 1 do
    animCurve:setKey( i, 0.4 * (i-1), animTable[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end

  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, jumpBoost.prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()
  
  jumpBoost.body:addRect(10, 0, 64, 64)
  
  return jumpBoost
end