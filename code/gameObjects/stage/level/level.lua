function createLevel(map)
  local level = {
    map = dofile('assets/maps/'..map..'.lua'),
    width,
    height,
    name,
    specialTiles = {},
    collisionBoxes 
  }
  
  level.width = level.map.width * level.map.tilewidth
  level.height = level.map.height * level.map.tileheight

  width = ( level.height / 9 ) * 16
  engine:resizeViewport(level.width, level.height)
  --engine:resizeViewport(width, level.height)
  engine:playMusic('assets/sounds/music/Level.wav', 0.8)
  
  function level:destroy()
    engine.gameUI = nil
    engine.uiIsActive = false
    engine:clearAll()
  end
  
  function level:rectInBoxes(x, y, width, height, margin)
    
    for key, box in pairs(self.collisionBoxes) do
      if rectInRect(x, y, width, height, box.x, box.y, box.width, box.height, margin) then
        print ("in rect")
        return true
      end
    end
    
    print ("not in rect")
    return false
  end

  return level
end