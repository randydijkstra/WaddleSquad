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
  
  local tile = iif( isHard,
    createCollidingGameObject(x, y, deck, MOAIBox2DBody.STATIC ),
    createDrawableGameObject(x, y, deck )
  )
  table.insert(tile.factions, 'tiles')
  
  tile.prop:setIndex(index)
  
  if isHard then
    table.insert(tile.factions, 'hardTiles')
    tile.body:addRect( -2, 0, tileset.tilewidth+2, tileset.tileheight) -- the -2 and +2 are because objects sometimes colide against the tile next to the one below them and overlaping seems to lessen this issue
  end
  
  return tile
end