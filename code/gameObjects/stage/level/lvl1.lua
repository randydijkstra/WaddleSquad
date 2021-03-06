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
    
    engine.gameUI = engine:addGameObject(getGameUI(config.penguinStartPosition.lvl1))
    engine.gameUI:start()
    
    engine:addGameObject(
      createPenguin(
        config.penguinStartPosition.lvl1.x,
        config.penguinStartPosition.lvl1.y
      )
    )
  end
  
  return level
end