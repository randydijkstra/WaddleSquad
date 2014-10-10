function createSnowflake(x, y, snowflaketype)
  local tileDeck = iif( snowflaketype == "small",
    engine:loadTileDeck( 
      "assets/sprites/special/Sneeuwvlok-spreadsheet.png", 
      8, 1, 
      0, 0, 32, 32 
    ),
    engine:loadTileDeck(
      "assets/sprites/special/Sneeuwvlok-big-spreadsheet.png", 
      8, 1, 
      0, 0, 64, 64 
    )
  )
  
  local snowflake = createCollidingGameObject(x, y, tileDeck, MOAIBox2DBody.STATIC)

  table.insert(snowflake.factions, 'snowflakes')
  snowflake.type = snowflaketype
  snowflake.name = iif( snowflaketype == "small", "small", "big")
  
  local snowflakeAnimTable = {1, 2, 3, 4, 5, 6, 7, 8, 0}
  
  local animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( #snowflakeAnimTable )

  for i = 1, #snowflakeAnimTable, 1 do
    animCurve:setKey( i, 0.1 * (i-1), snowflakeAnimTable[i], MOAIEaseType.FLAT) -- hoeveelste, tijd, index in sheet, easing type
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
  
  function snowflake:onPenguinCollision()
    --print(iif(snowflake.type == "small","+25 points","+50 points"))
    local showAddedScore = createTextBox(x+30, y-55, 60, 30, iif(snowflake.type == "small", "+25", "+50"), 25, true)
    showAddedScore.prop:moveScl(0.4, 0.4, 1, 0.8, MOAIEaseType.EASE_IN)
    local x, y = showAddedScore.prop:getLoc()
    showAddedScore.prop:seekLoc(
      x, 
      y + 20,
      1,
      1.5,
      MOAIEaseType.EASE_IN
    )
    engine:addGameObject(showAddedScore)
    
    local promise = createPromise(1.1, function()        
      engine:deleteGameObject(showAddedScore)
    end)
  end

  return snowflake
end