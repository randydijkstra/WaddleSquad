function createIglo(x, y)
  local texture = engine:loadImageTexture('assets/sprites/tiles/Iglo.png')
  local deck = engine:loadQuad('assets/sprites/tiles/Iglo.png', texture:getSize())
  
  local iglo = createCollidingGameObject(x, y, deck, MOAIBox2DBody.STATIC)

  table.insert(iglo.factions, 'iglos')
  local width, height = texture:getSize()
  iglo.body:addRect(50, 0, width, height - 80)
  
  return iglo
end