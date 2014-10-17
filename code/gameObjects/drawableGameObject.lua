function createDrawableGameObject(x, y, deck)
  local drawableGameObject = createGameObject()
  table.insert(drawableGameObject.factions,'drawables')
  
  drawableGameObject.x = x
  drawableGameObject.y = y
  drawableGameObject.animationSpd = config.defaultAnimationSpeed
  
  
  local prop = MOAIProp2D.new()
  if deck then prop:setDeck(deck) end
  prop:setLoc(drawableGameObject.x, drawableGameObject.y)

  drawableGameObject.prop = prop

  function drawableGameObject:setAnimation(animationTable)
    local animCurve = MOAIAnimCurve.new()
    animCurve:reserveKeys( #animationTable)

    for i = 1, #animationTable, 1 do
        animCurve:setKey( i, self.animationSpd * (i-1), animationTable[i], MOAIEaseType.FLAT ) -- hoeveelste, tijd, index in sheet, easing type
    end

    local anim = MOAIAnim.new()
    anim:reserveLinks( 1 )
    anim:setLink( 1, animCurve, self.prop, MOAIProp2D.ATTR_INDEX )
    anim:setMode( MOAITimer.LOOP )
    anim:start()
  end

  return drawableGameObject
end