function createSnowflake(x, y, snowflaketype)
  local tileDeck = iif( snowflaketype == "small",
    engine:loadTileDeck( 
      "assets/sprites/special/Sneeuwvlok-spreadsheet.png", 
      2, 1, 
      0, 0, 25, 25 
    ),
    engine:loadTileDeck(
      "assets/sprites/special/Sneeuwvlok-big-spreadsheet.png", 
      2, 1, 
      0, 0, 50, 50 
    )
  )
  
  local snowflake = createCollidingGameObject(x, y, tileDeck, MOAIBox2DBody.STATIC)

  table.insert(snowflake.factions, 'snowflakes')
  snowflake.type = snowflaketype
  snowflake.name = iif( snowflaketype == "small", "small", "big")
  
  if snowflake.name == "small" then
    snowflake.body:addRect(0, 0, 25, 25):setSensor(true)
  else
    snowflake.body:addRect(0, 0, 50, 50):setSensor(true)
  end
  
  local animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( 2 )

  for i = 1, 2, 1 do
    animCurve:setKey( i, 0.15 * i, i, MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end
  
  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, snowflake.prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()

  return snowflake
end