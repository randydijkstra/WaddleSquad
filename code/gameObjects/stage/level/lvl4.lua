function getLvl4()
  local level = createLevel('lvl4')
  level.name = 'lvl4'
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    
    engine.gameStats = engine:addGameObject(createGameStats(
      'lvl4', 
      0, 
      defaultGameStats.levelStartTime.lvl4
    ))
    engine.gameStats:start()
    
    engine.gameUI = engine:addGameObject(getGameUI())
    engine.gameUI:start()
    
    engine:addGameObject(createPenguin(-50, -480))
  end
  
  return level
end