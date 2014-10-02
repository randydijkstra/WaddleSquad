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


  function level:destroy()
    
  end

  return level
end