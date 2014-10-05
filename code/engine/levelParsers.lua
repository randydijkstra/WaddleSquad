--[[--
  Contains the logic needed to load / parse level data
--]]--

function loadAssetsFrom(level)
  
  -- load tile maps needed for this level
  
  for key, tileset in pairs(level.map.tilesets) do
      engine:loadTileDeck(
      tileset.image, 
      tileset.imagewidth / tileset.tilewidth, 
      tileset.imageheight / tileset.tileheight,
      tileset.tilewidth,
      tileset.tileheight
    )
  end
  
end

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
      
      local isHard = false
      if layer.properties["Hard"] then
        isHard = true
      end
      
      local tile = createTile(
        tileSet.image, 
        tileId - (tileSet.firstgid-1), 
        x, 
        y,
        tileSet.tilewidth, 
        tileSet.tileheight,
        isHard
      );
      
      engine:addGameObject(tile) 
      
    end
    
  end
end

function parseObjectLayer(layer, level)
  
  for key, object in pairs(layer.objects) do
    
    if object.type == "iglo" then
      local iglo = createIglo(object.x + 100, -object.y + 75)
      engine:addGameObject(iglo)
    end  
    
    if object.type == "sneeuwvloksmall" then
      local snowflakeSmall = createSnowflake(object.x + 25, -object.y + 12.5, "small")
      engine:addGameObject(snowflakeSmall)
    end
    
     if object.type == "sneeuwvlokbig" then
      local snowflakeBig = createSnowflake(object.x + 50, -object.y + 25, "big")
      engine:addGameObject(snowflakeBig)
    end
    
  end
  
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