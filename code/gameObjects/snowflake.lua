function createSnowflake(x, y, snowflaketype)
  local snowflake = createDrawableGameObject(x, y)

  table.insert(snowflake.factions, 'snowflake')
  
  local flaketype = snowflaketype
  local tileDeck = MOAITileDeck2D.new()
  
  if flaketype == "small" then
    tileDeck:setTexture( "assets/sprites/special/Sneeuwvlok-spreadsheet.png" )
    tileDeck:setSize( 2, 1 )
    tileDeck:setRect( -25, -12.5, 25, 12.5 )
  elseif flaketype == "big" then
    tileDeck:setTexture('assets/sprites/special/Sneeuwvlok-big-spreadsheet.png')
    tileDeck:setSize( 2, 1 )
    tileDeck:setRect( -50, -25, 50, 25 )
  end

  local prop = MOAIProp2D.new()
  prop:setDeck( tileDeck )
  prop:setLoc(snowflake.x, snowflake.y)
  
  snowflake.prop = prop
  
  animCurve = MOAIAnimCurve.new()
  animCurve:reserveKeys( 2 )

  for i = 1, 2, 1 do
    animCurve:setKey( i, 0.15 * i, i, MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
  end
  
  anim = MOAIAnim.new()
  anim:reserveLinks( 1 )
  anim:setLink( 1, animCurve, prop, MOAIProp2D.ATTR_INDEX )
  anim:setMode( MOAITimer.LOOP )
  anim:start()
  
  local body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
  body:setTransform(snowflake.x, snowflake.y)
  if flaketype == "small" then
     body:addRect(-12.5, -12.5, 12.5, 12.5)
  elseif flaketype == "big" then
     body:addRect(-25, -25, 25, 25)
  end
  
  snowflake.body = body

  return snowflake
end