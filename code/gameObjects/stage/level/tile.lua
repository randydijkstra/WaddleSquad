function createTile(deck, index, x, y, width, height, isHard) 
  
  local tile = iif( isHard,
    createCollidingGameObject(x, y, engine:loadTileDeck(deck), MOAIBox2DBody.STATIC ),
    createDrawableGameObject(x, y, engine:loadTileDeck(deck) )
  )
  table.insert(tile.factions, 'tiles')
  
  tile.prop:setIndex(index)
  
  if isHard then
    table.insert(tile.factions, 'hardTiles')
    tile.body:addRect( -2, 0, width+2, height) -- the -2 and +2 are because objects sometimes colide against the tile next to the one below them and overlaping seems to lessen this issue
  end
  
  return tile
end