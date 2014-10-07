--[[--
  Most basic object only containing eneugh information to be stored in the engine
--]]--

function createGameObject()
  local gameObject = {
    id = engine:getNewId(),
    factions = {}, -- which collection should this object be part of
  }
  
  function gameObject:hasFaction(faction)
    return isStringInTable(self.factions, faction)
  end
  
  return gameObject
end