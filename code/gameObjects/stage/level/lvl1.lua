function getLvl1()
  local level = createLevel('lvl1')
  level.name = 'lvl1'
  
  loadAssetsFrom(level)
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    engine.gameStats = createGameStats(
      'lvl1', 
      0, 
      defaultGameStats.levelStartTime.lvl1
    )
    engine.gameStats:start()
    penguin = engine:addGameObject(createPenguin(0, -400))
  end
  
  return level
end