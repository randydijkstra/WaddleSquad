function getLvl2()
  local level = createLevel('lvl2')
  level.name = 'lvl2'
  
  loadAssetsFrom(level)
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    engine.gameStats = createGameStats(
      'lvl2', 
      0, 
      defaultGameStats.levelStartTime.lvl2
    )
    engine.gameStats:start()
    penguin = engine:addGameObject(createPenguin(-50, -380))
  end
  
  return level
end