function createTile(deck, index, x, y, width, height, isHard) 
  
  local tile = createDrawableGameObject(x, y)
  table.insert(tile.factions, 'tiles')
  
  local prop = MOAIProp2D.new()
  prop:setDeck(engine:loadTileDeck(deck))
  prop:setLoc(tile.x, tile.y)
  prop:setIndex(index)
  
  tile.prop = prop
  
  if isHard then
    table.insert(tile.factions, 'hard')
    local body = engine.box2DWorld:addBody( MOAIBox2DBody.STATIC )
    body:setTransform(tile.x, tile.y)
    body:addRect( 0, 0, width, height )
    
    tile.body = body
  end
  
  return tile
end