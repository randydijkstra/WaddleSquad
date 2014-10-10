function createTile(tileset, index, x, y, isHard) 
  
  local deck = engine:loadTileDeck(
      tileset.image, 
      tileset.imagewidth / tileset.tilewidth, 
      tileset.imageheight / tileset.tileheight,
      0,
      0, 
      tileset.tilewidth,
      tileset.tileheight
  )  
  
  --local tile = createDrawableGameObject(x, y, deck )
  
  local tile
  if isHard then
    tile = createDrawableGameObject(x, y, deck )
  else
    tile = createDrawableGameObject(x, y, deck )
  end
  
  --[[
    Somehow this doesn't work
    local tile = iif( 
      isHard,
      createCollidingGameObject(x, y, deck, MOAIBox2DBody.STATIC ),
      createDrawableGameObject(x, y, deck )
    )  
  --]]
  
  table.insert(tile.factions, 'tiles')
  
  tile.prop:setIndex(index)
  
  if isHard then
    table.insert(tile.factions, 'hardTiles')
    tile.body:addRect( 0, 0, tileset.tilewidth, tileset.tileheight)
  end
  
  return tile
end