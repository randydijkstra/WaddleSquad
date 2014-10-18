function getLvl5()
  local level = createLevel('lvl5')
  level.name = 'lvl5'
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    
    engine.gameStats = engine:addGameObject(createGameStats(
      'lvl5', 
      0, 
      config.levelStartTime.lvl5
    ))
    engine.gameStats:start()
    
    engine.gameUI = engine:addGameObject(getGameUI())
    engine.gameUI:start()
    
    engine:addGameObject(
      createPenguin(
        config.penguinStartPosition.lvl5.x,
        config.penguinStartPosition.lvl5.y
      )
    )
  end
  
  return level
end