function getLvl3()
  local level = createLevel('lvl3')
  level.name = 'lvl3'
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    
    engine.gameStats = engine:addGameObject(createGameStats(
      'lvl3', 
      0, 
      config.levelStartTime.lvl3
    ))
    engine.gameStats:start()
    
    engine.gameUI = engine:addGameObject(getGameUI())
    engine.gameUI:start()
    
    engine:addGameObject(
      createPenguin(
        config.penguinStartPosition.lvl3.x,
        config.penguinStartPosition.lvl3.y
      )
    )
  end
  
  return level
end