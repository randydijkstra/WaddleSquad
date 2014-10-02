local ResourceDefinitions = {}

RESOURCE_TYPE_IMAGE = 0
RESOURCE_TYPE_FONT = 1
RESOURCE_TYPE_SOUND = 2
RESOURCE_TYPE_TILED_IMAGE = 3

function ResourceDefinitions:set(name, definition)
  definitions[name] = definition
end

function ResourceDefinitions:get(name)
  return definitions[name]
end

function ResourceDefinitions:remove (name)
  definitions[name] = nil
end

--[[ 
RESOURCE_TYPE_SPRITE = 0
RESOURCE_TYPE_FONT = 1
RESOURCE_TYPE_SOUND = 2
]]--

return ResourceDefinitions




