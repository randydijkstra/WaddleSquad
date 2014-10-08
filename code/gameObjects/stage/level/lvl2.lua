function getLvl2()
  local level = createLevel('lvl2')
  level.name = 'lvl2'
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true

    engine.gameStats = engine:addGameObject(createGameStats(
      'lvl2', 
      0, 
      defaultGameStats.levelStartTime.lvl2
    ))
    engine.gameStats:start()
    
    engine.gameUI = engine:addGameObject(getGameUI())
    engine.gameUI:start()
    
    engine:addGameObject(createPenguin(-50, -380))
    engine:addGameObject(createJumpBoost(925, -512))
  end
  
  return level
end