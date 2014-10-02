--[[--
  Most basic object only containing eneugh information to be stored in the engine
--]]--

function createGameObject()
  local gameObject = {
    id = engine:getNewId(),
    factions = {}, -- which collection should this object be part of
    draw = false, -- should this object be drawn 
  }
  
  return gameObject
end