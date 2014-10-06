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
    penguin = engine:addGameObject(createPenguin(0, -400))
  end
  
  return level
end