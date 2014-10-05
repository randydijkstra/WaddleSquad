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
  
  --[[
    16:9
    
    9:16
    h / w
    720 -> 1280
    1080 -> 1920
    
    
    720/9 * 16
  ]]--
  
  width = ( level.height / 9 ) * 16
  engine:resizeViewport(width, level.height)
  
  return level
end