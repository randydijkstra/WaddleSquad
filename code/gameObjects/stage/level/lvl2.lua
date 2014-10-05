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
    penguin = engine:addGameObject(createPenguin(0, -300))
  end
  
  return level
end