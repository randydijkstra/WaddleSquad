function createLevel(map)
  print('assets/maps/'..map..'.lua')
  local level = {
    map = dofile('assets/maps/'..map..'.lua'),
    width,
    height,
    name,
    specialTiles = {}
  }
  
  level.width = level.map.width * level.map.tilewidth
  level.height = level.map.height * level.map.tileheight

  width = ( level.height / 9 ) * 16
  engine:resizeViewport(level.width, level.height)
  --engine:resizeViewport(width, level.height)

  function level:destroy()
    engine.gameUI = nil
    engine.uiIsActive = false
    engine:clearAll()
  end

  return level
end