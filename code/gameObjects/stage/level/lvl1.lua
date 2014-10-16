function getLvl1()
  local level = createLevel('lvl1')
  level.name = 'lvl1'

  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    
    engine.gameStats = engine:addGameObject(createGameStats(
      'lvl1', 
      0, 
      config.levelStartTime.lvl1
    ))
    engine.gameStats:start()
    
    engine.gameUI = engine:addGameObject(getGameUI())
    engine.gameUI:start()
    
    engine:addGameObject(createPenguin(0, -400))
  end
  
  return level
end