function createSnowflake(x, y, snowflaketype)
  local tileDeck = iif( snowflaketype == "small",
    engine:loadTileDeck( 
      "assets/sprites/special/Sneeuwvlok-spreadsheet.png", 
      4, 1, 
      0, 0, 32, 32 
    ),
    engine:loadTileDeck(
      "assets/sprites/special/Sneeuwvlok-big-spreadsheet.png", 
      4, 1, 
      0, 0, 64, 64 
    )
  )
  
  local snowflake = createCollidingGameObject(x, y, tileDeck, MOAIBox2DBody.STATIC)

  table.insert(snowflake.factions, 'snowflakes')
  snowflake.type = snowflaketype
  snowflake.name = iif( snowflaketype == "small", "small", "big")
  
  local snowflakeAnimTable = {1, 2, 3, 4, 0}
  
  local animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #snowflakeAnimTable )

  for i = 1, #snowflakeAnimTable, 1 do
    animCurve:setKey( i, 0.4 * (i-1), snowflakeAnimTable[i], MOAIEaseType.FLAT) -- hoeveelste, tijd, index in sheet, easing type
  end
  
  local anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, snowflake.prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()
  
  if snowflake.name == "small" then
    snowflake.body:addRect(0, 0, 32, 32):setSensor()
  else
    snowflake.body:addRect(0, 0, 64, 64):setSensor()
  end

  return snowflake
end