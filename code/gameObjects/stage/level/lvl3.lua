function getLvl3()
  local level = createLevel('lvl3')
  level.name = 'lvl3'
  
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