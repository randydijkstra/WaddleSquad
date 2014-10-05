function createIglo(x, y)
  local iglo = createDrawableGameObject(x, y)

  table.insert(iglo.factions, 'iglos')
  
  local texture = engine:loadImageTexture('assets/sprites/tiles/Iglo.png')
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( texture )
  quad:setRect(
    -100, 
    -75, 
    100, 
    75
  )
  
  local prop = MOAIProp2D.new()
  prop:setDeck(quad)
  prop:setLoc(iglo.x, iglo.y)
  
  iglo.prop = prop
 
  local body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
  body:setTransform(iglo.x, iglo.y)
  body:addRect(-100, -75, 100, 75)
  
  iglo.body = body
  
  return iglo
end