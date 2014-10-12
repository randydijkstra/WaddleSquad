--[[--
  Contains the logic needed to load / parse level data
--]]--

function getSpecialTiles(level)
  if level.specialTiles and #level.specialTiles > 0 then
    return level.specialTiles
  end
  
  local specialTiles = {}
  
  for key, tileset in pairs(level.map.tilesets) do
    local idOffset = tileset.firstgid
    
    for key, tile in pairs(tileset.tiles) do
      specialTiles[tile.id+idOffset] = tile.properties
    end
    
  end
  
  return specialTiles
end

function parseLayer(layer, level)
  
  -- BUG: Currently the top of the first y row is at ypos -32 for some reason
  
  if layer.type=="objectgroup" then
    parseObjectLayer(layer, level)
    return
  end

  if layer.name == "Achtergrond" and config.debug2DDraw == true then
    return
  end
  
  if layer.properties["Hard"] then
    level.collisionBoxes = createBox2DBoxes(layer, level)
  end
  
  local offsetX = layer.x
  local offsetY = layer.y + 64
  
  for tileNumber, tileId in pairs(layer.data) do
    
    if tileId > 0 then
         -- Because lua arrays start at 1 instead of 0 (like everything else -_-) we make sure it starts at 0 this way
      tileNumber = tileNumber -1
      
      if getSpecialTiles(level)[tileId] ~= nil then
        -- special tile detected and should do something 
      end
        
      local tileSet = getTileSetFromTileId(tileId, level.map)
      
      local x = ( tileNumber - (math.floor(tileNumber / layer.width) * layer.width) ) * level.map.tilewidth + offsetX
      local y = - (math.floor(tileNumber / layer.width) * level.map.tileheight + offsetY) 
      
      local tile = createTile(
        tileSet, 
        tileId - (tileSet.firstgid-1), 
        x, 
        y
      );
      
      engine:addGameObject(tile) 
      
    end
    
  end
end

function parseObjectLayer(layer, level)
  
  for key, object in pairs(layer.objects) do
    
    if object.type == "iglo" then
      local iglo = createIglo(object.x, -object.y)
      engine:addGameObject(iglo)
    end  
    
    if object.type == "sneeuwvloksmall" then
      local snowflakeSmall = createSnowflake(object.x, -object.y, "small")
      engine:addGameObject(snowflakeSmall)
    end
    
     if object.type == "sneeuwvlokbig" then
      local snowflakeBig = createSnowflake(object.x, -object.y, "big")
      engine:addGameObject(snowflakeBig)
    end
    
  end
  
end

function createBox2DBoxes(layer, level)

  -- list all tiles and their relation to other tiles  
  local tiles = {
    -- tileNumber = { tileNumber, belongsTo }
  }  
  
  for tileNumber, tileId in pairs(layer.data) do
   
    tileNumber  = tileNumber -1 -- table should start at key 0
   
    if tileId > 0 then
      -- Tile found
      local tileIdLeft = iif( tileNumber % layer.width == 0, 0, layer.data[tileNumber] )
      local tileIdTop = iif( tileNumber < layer.width, 0, layer.data[tileNumber+1 - layer.width])
      local tileIdLeftTop = iif( 
        tileNumber % layer.width == 0 and tileNumber < layer.width, 
        0, 
        layer.data[tileNumber - layer.width]
      )
      
      local belongsTo = false
      
      if tileIdTop > 0 then
        belongsTo =  tileNumber - layer.width
      elseif tileIdLeft > 0 and tileIdLeftTop <= 0 then
        belongsTo = tileNumber - 1 
      end
      
      tiles[tostring(tileNumber)] = { 
        tileNumber = tileNumber, 
        belongsTo = belongsTo
      }
      
    end
  end
  
  -- sort all tiles into sets
  local sets = {
    -- topLeftId = { tileNumber, tileNumber }
  }
  
  function getParentTile(tileNumber)
    if tiles[tostring(tileNumber)].belongsTo then
      return getParentTile(tiles[tostring(tileNumber)].belongsTo)
    else
      return tileNumber
    end
  end

  for key, tile in pairs(tiles) do 
    local belongsTo = getParentTile(tile.tileNumber)
    if sets[tostring(belongsTo)] then
      table.insert(sets[tostring(belongsTo)], tile.tileNumber)
    else
      sets[tostring(belongsTo)] = {}
      table.insert(sets[tostring(belongsTo)], tile.tileNumber)
    end
  end
  
  -- create all box2DBoxes
  local boxes = {
    --{ x, y, width, height } 
  }
  
  for firstTileNumer, subTiles in pairs(sets) do
    local x = ( firstTileNumer - (math.floor(firstTileNumer / layer.width) * layer.width) ) * level.map.tilewidth + layer.x
    local y = - (math.floor(firstTileNumer / layer.width) * level.map.tileheight + layer.y) 
    
    local highestTileNumber = 0 -- the bottomRight tile
    for key, tileNumber in pairs(subTiles) do 
      if highestTileNumber < tileNumber then highestTileNumber = tileNumber end
    end
    
    local xMax = ( highestTileNumber - (math.floor(highestTileNumber / layer.width) * layer.width) ) * level.map.tilewidth + layer.x + level.map.tilewidth
    local yMax = - (math.floor(highestTileNumber / layer.width) * level.map.tileheight + level.map.tileheight) 
    
    table.insert( boxes, { x = x, y = y, width = math.dif(xMax, x), height = math.dif(yMax, y) } )
  end
  
  -- add boxes to the engine and save to level
  
  local collisionBoxes = {}
  
  for key, box in pairs(boxes) do
    table.insert(collisionBoxes, engine:addGameObject(createCollisionBox(box.x, box.y, box.width, box.height)))
  end
  
  return collisionBoxes
end

function getTileSetFromTileId(tileId, map)
  -- This is a very slow way (compared to saving the break points) but atleast it doesn't require extra vars to be set 
  -- Which i don't feel like doing now
  for i = #map.tilesets, 1, -1 do
    if tileId >= map.tilesets[i].firstgid then
      return map.tilesets[i]
    end
  end

  print("No tileSet found for tileId:"..tileId.." This probaply means your map is broken")
  
end