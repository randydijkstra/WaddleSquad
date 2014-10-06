function getLvl4()
  local level = createLevel('lvl4')
  level.name = 'lvl4'
  
  loadAssetsFrom(level)
  
  for key, layer in pairs(level.map.layers) do
    parseLayer(layer, level)
  end
  
  engine.currentLevel = level
  
  function level:start()
    engine.inLevel = true
    penguin = engine:addGameObject(createPenguin(-50, -380))
  end
  
  return level
end