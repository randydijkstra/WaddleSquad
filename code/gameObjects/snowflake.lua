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
  
  local fixture
  if snowflake.name == "small" then
    fixture = snowflake.body:addRect(0, 0, 32, 32)
  else
    fixture = snowflake.body:addRect(0, 0, 64, 64)
  end
  fixture:setSensor()
  fixture:setFilter(config.maskBits.snowflake)
  
  function snowflake:collect()

    engine.gameStats:updateStats(self.type)
    
    local width = iif(self.type == "small",32,64)
    local height = iif(self.type == "small",32,64)
    local score = iif(self.type == "small", 25, 50)
    local x, y = engine:mainToUi(self.x+width/2, self.y+height)
    engine:addGameObject(createScore(x, y, score, 60, 30, 25))
  
    engine:deleteGameObject(self)
  end

  return snowflake
end