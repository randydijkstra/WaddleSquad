--[[--
  Most basic object only containing eneugh information to be stored in the engine
--]]--

function createGameObject()
  local gameObject = {
    id = engine:getNewId(),
    factions = {}, -- which collection should this object be part of
  }
  
  function gameObject:hasFaction(faction)
    -- Slower than engine:isInFaction so only use this before the object is added to the engine
    return isStringInTable(self.factions, faction)
  end
  
  function gameObject:extend(old, new)
    -- super magic afro-elvish vodoo to have "extend" functionality
    -- only works without parameters for now
    return function()
      old(self)
      new(self)
    end
  end
  
  return gameObject
end