function createIglo(x, y)
  local texture = engine:loadImageTexture('assets/sprites/tiles/Iglo.png')
  local deck = engine:loadQuad('assets/sprites/tiles/Iglo.png', texture:getSize())
  
  local iglo = createCollidingGameObject(x, y, deck, MOAIBox2DBody.STATIC)

  table.insert(iglo.factions, 'iglos')
  
  local width, height = texture:getSize()
  iglo.body:addRect(50, 0, width, height - 80)
  
  function iglo:onPenguinCollision()
    
    local x, y = engine.uiLayer:worldToWnd(engine.mainLayer:worldToWnd(self.prop:getLoc()))
    local width = iif(iglo.type == "small",32,64)
    local height = iif(iglo.type == "small",32,64)
    
    local showAddedScore = createTextBox(x+width/2, y+height, 75, 50, "+200", 35, true)    
    engine:addGameObject(showAddedScore)
    showAddedScore.prop:moveScl(0.4, 0.4, 1, 0.8, MOAIEaseType.EASE_IN)
    local x, y = showAddedScore.prop:getLoc()
    showAddedScore.prop:seekLoc(
      x, 
      y + 20,
      1,
      1.5,
      MOAIEaseType.EASE_IN
    )
    
    local promise = createPromise(1.5, function()        
      engine:deleteGameObject(showAddedScore)
    end)
  end
  
  return iglo
end