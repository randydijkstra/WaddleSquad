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
  
  local tile = createDrawableGameObject(x, y, deck )
  
  table.insert(tile.factions, 'tiles')
  
  tile.prop:setIndex(index)

  return tile
end