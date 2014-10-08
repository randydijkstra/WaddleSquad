function createIglo(x, y)
  local iglo = createDrawableGameObject(x, y)

  table.insert(iglo.factions, 'iglos')
  
  local texture = engine:loadImageTexture('assets/sprites/tiles/Iglo.png')
  
  local prop = MOAIProp2D.new()
  prop:setDeck(engine:loadQuad('assets/sprites/tiles/Iglo.png', texture:getSize()))
  prop:setLoc(iglo.x, iglo.y)
  
  iglo.prop = prop
 
  local body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
  body:setTransform(iglo.x, iglo.y)
  body:addRect(50, 0, texture:getSize())
  
  iglo.body = body
  
  return iglo
end