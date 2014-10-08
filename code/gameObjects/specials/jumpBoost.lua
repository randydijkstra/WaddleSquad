function createJumpBoost()
  local texture = engine:loadImageTexture('assets/sprites/special/bear.png')
  local deck = engine:loadQuad('assets/sprites/special.png', texture:getSize())
  
  local iglo = createCollidingGameObject(x, y, deck, MOAIBox2DBody.STATIC)

  table.insert(iglo.factions, 'iglos')

  iglo.body:addRect(50, 0, texture:getSize())
  
  return iglo
  
end