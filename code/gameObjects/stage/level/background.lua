function createBackground(x ,y)
  --select background image, spawn prop and return it
  
  local background = createDrawableGameObject(x, y)
  
  --table.insert(background.factions, 'staticSprites')
  spritePath = 'assets/sprites/bg/'
  
  texture = MOAIImageTexture.new()
  texture:load( spritePath .. 'bgtwilight.png' )
  --texture:resize(256, 256)
  texture:invalidate()
  texture:setWrap(true)
  
  quad = MOAIGfxQuad2D.new()
  quad:setTexture( texture )
  quad:setRect(
    -256, 
    -160, 
    256, 
    160
  )
  
  scaleX = config.prefferedWidth / texture:getSize(width)
  scaleY = config.prefferedHeight / texture:getSize(height)
  print("ScaleX: ".. scaleX)
  print("ScaleY: ".. scaleY)

  local prop = MOAIProp2D.new()
  prop:setDeck(quad)
  prop:setScl(scaleX, scaleY)
  prop:setLoc(config.prefferedWidth/2, -config.prefferedHeight/2)
  
  background.prop = prop
  
  return background
end