local assetManager = {}

ASSETS_PATH = 'assets/'

spritePath = ASSETS_PATH .. 'sprites'
soundPath = ASSETS_PATH .. 'sounds'
fontPath = ASSETS_PATH .. 'fonts'

cache = {}

--[[function loadSprites()
  print('Loading sprites')
  
  print ('Sprites loaded!')
end

function loadSounds()
  print('Loading sounds')
  
  print ('Sounds loaded!')
end]]--

function assetManager:get ( name )
  if (not self:loaded ( name )) then
    self:load ( name )
  end
  return cache[name]
end

function assetManager:loaded ( name )
  return cache[name] ~= nil
end 

function assetManager:load ( name )
  local resourceDefinition = ResourceDefinitions:get( name )
  if not resourceDefinition then
    print('ERROR: Missing resource definition for' .. name)
  else
    local resource
    
    if (resourceDefinition.type == RESOURCE_TYPE_IMAGE) then
       resource = self:loadImage ( resourceDefinition )
    elseif (resourceDefinition.type == RESOURCE_TYPE_TILED_IMAGE)then
       resource = self:loadTiledImage ( resourceDefinition )
    elseif (resourceDefinition.type == RESOURCE_TYPE_FONT) then
       resource = self:loadFont ( resourceDefinition )
    elseif (resourceDefinition.type == RESOURCE_TYPE_SOUND) then
       resource = self:loadSound ( resourceDefinition )
    end
    
     -- store the resource under the name on cache
    cache[name] = resource
  end
end

function assetManager:loadGfxQuad2D ( filePath, coords )
  local image = MOAIGfxQuad2D.new ()
  image:setTexture ( filePath )
  image:setRect ( unpack(cords) )
  return image
end
--[[loadSprites()
loadSounds()]]--

return assetManager 