engine = {
  mainViewport,
  uiViewPort,
  mainLayer,
  menuLayer,
  uiLayer,
  camera, -- handels what part can be vieuwed in the mainLayer
  gameObjects = {
      all = {},
      factions = {
        penguins = {},
        update = {}, -- every object in this faction gets it's update() called
        moveable = {}, -- every object that should have it's move called
        staticSprites = {},
        menus = {},
        ui = {}, -- objects that should be placed in the ui layer
        touchables = {} -- objects that are checked against touch
      },
  },
  box2DWorld,
  currentLevel = false, -- contains either false if no level is loaded or the current level
  uiIsActive = false,
  gameUI = {}, -- holds the ui controler
  gameStats = {}, -- holds the gameStats controller
  storage = {}, -- persitent data between games
  cache = {
    quads = {}, -- current loaded quads
    tileDecks = {}, -- current loaded tilesets,
    imageTextures = {}, -- current loaded image textures
    fonts = {}, -- table that hold all loaded fonts 
    fontStyles = {}, -- table that hold all loaded fonts
    sounds = {} -- table that hold all loaded sounds
  },
  input,
  ids = {}, -- holds every generated id
  inLevel = false, -- variable to check if a level is being played
}
engine.__index = engine

function engine:start()
  self.input = self:addGameObject(createInput());  
  engine.box2DWorld:start() 

  local thread = MOAICoroutine.new()
  thread:run(
    function()
      while true do
        engine:heartBeat()
        coroutine.yield()
      end
    end
  )
end

function engine:heartBeat()  
    
  for id, gameObject in pairs(engine:getFaction("update")) do
    if gameObject.preUpdate then gameObject:preUpdate() end
    gameObject:update()
    if gameObject.postUpdate then gameObject:postUpdate() end
  end    
  
  if MOAIGfxDevice.setClearColor then
    MOAIGfxDevice.setClearColor(1,1,1,1)
  else -- MOAI 1.4 changed setClearColor interface
    MOAIGfxDevice.getFrameBuffer():setClearColor(1,1,1,1)
  end

end

function engine:addGameObject(gameObject)
  self.gameObjects.all[gameObject.id] = gameObject
 
  if gameObject.factions then
    for key, value in pairs(gameObject.factions) do
      
      -- Check if the faction exist and create it if not
      if not self.gameObjects.factions[value] then
        self.gameObjects.factions[value] = {}
      end
      
      self.gameObjects.factions[value][gameObject.id] = gameObject
    end
  end
  
  if gameObject.body then
    gameObject.body.parent = gameObject
  end
  
  if gameObject.prop and config.debugSpriteDraw then
    if self:isInFaction(gameObject, "ui") then
      self.uiLayer:insertProp(gameObject.prop)
    else
      self.mainLayer:insertProp(gameObject.prop)
    end
  end  

  if gameObject.onAdd then
    gameObject:onAdd()
  end

  return gameObject
end

function engine:deleteGameObject(gameObject)
  
  self.gameObjects.all[gameObject.id] = nil
  
  if gameObject.prop then
    if self:isInFaction(gameObject, "ui") then
      self.uiLayer:removeProp(gameObject.prop) 
    else
      self.mainLayer:removeProp(gameObject.prop) 
    end   
  end
  
  if gameObject.body then
    gameObject.body:destroy()
  end 

  if gameObject.factions then
    for key, value in pairs(gameObject.factions) do
      self.gameObjects.factions[value][gameObject.id] = nil
    end
  end
  
  if gameObject.onDestroy then
    gameObject:onDestroy()
  end
  
  gameObject = nil
end

function engine:getNewId()
  id = tostring(math.random(900001))
  
  while self.ids[id] do 
    id = tostring(math.random(900001))
  end
  
  self.ids[id] = true
  return id;
end

function engine:activateMoveAbleGameObjects()
  
  -- Doesn't work (the setActive call) atm and no idea why

  for id, gameObject in pairs(engine:getFaction("moveable")) do
    if gameObject.body then
      gameObject.body:setActive(true)
     end
  end
end


function engine:loadTileDeck(path, deckXRows, deckYRows, xMin, yMin, xMax, yMax)
  
  if self.cache.tileDecks[path..xMax..yMax] then
    return self.cache.tileDecks[path..xMax..yMax]
  end
  
  local tileDeck = MOAITileDeck2D.new()
  tileDeck:setTexture( iif(config.useTextureLoad, engine:loadImageTexture(path), path) )
  tileDeck:setSize(deckXRows, deckYRows)
  tileDeck:setRect( xMin, yMin, xMax, yMax )
  
  self.cache.tileDecks[path..xMax..yMax] = tileDeck
  
  return tileDeck
end

function engine:loadQuad(path, width, height)
  if self.cache.quads[path..width..height] then
    return self.cache.quads[path..width..height]
  end
  
  local quad = MOAIGfxQuad2D.new()
  
  quad:setTexture( iif(config.useTextureLoad, engine:loadImageTexture(path), path) )
  quad:setRect(0, 0, width, height) -- we position everything from the right top
 
  self.cache.quads[path..width..height] = quad
  
  return quad
end


function engine:loadImageTexture(path)  
  
  if self.cache.imageTextures[path] then
    return self.cache.imageTextures[path]
  end
  
  local texture = MOAIImageTexture.new()
  texture:load( path )
  texture:invalidate() -- power of two thingy
  
  self.cache.imageTextures[path] = texture
  
  return texture
end

function engine:loadFont(path)
  
  if self.cache.fonts[path] then
    return self.cache.fonts[path]
  end
  
  local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
  local font = MOAIFont.new()
  font:load( path )
  font:preloadGlyphs( charCodes, 24 ) 
  
  self.cache.fonts[path] = font
  
  return font
end

function engine:loadFontStyle(path, size)

  if self.cache.fontStyles[path..size] then
    return self.cache.fontStyles[path..size]
  end

  local fontStyle = MOAITextStyle.new()
  fontStyle:setFont( self:loadFont(path) )
  fontStyle:setSize( size )
  fontStyle:setColor( 0,0,0,1 )

  self.cache.fontStyles[path..size] = fontstyle
  return fontStyle
  
end

function engine:playSound(path, volume)
  if engine.storage:get("muteSound", "config") == false then
    local sound = self:loadSound(path)
    if volume then
      sound:setVolume(volume)
    end
    sound:play() 
  end
end

function engine:loadSound(path)
  if self.cache.sounds[path] then
    return self.cache.sounds[path]
  else
    local sound = MOAIUntzSound.new()
    sound:load(path)
    self.cache.sounds[path] = sound
    return sound
  end
end

function engine:resizeViewport(width, height)
  print("resize to: "..width..","..height)
  self.viewport:setScale(width, height)
end

function engine:loadLevel(level)
  if self.currentLevel then
    self.currentLevel:destroy()
  end
  
  print("loading: " .. level)
  
  if level == "level1" then
    local lvl1 = getLvl1()
    self.currentLevel = lvl1
    self.inLevel = true
    lvl1:start()
  elseif level == "level2" then
    local lvl2 = getLvl2()
    self.currentLevel = lvl2
    self.inLevel = true
    lvl2:start()
  elseif level == "level3" then
    local lvl3 = getLvl3()
    self.currentLevel = lvl3
    self.inLevel = true
    lvl3:start()
  elseif level == "level4" then
    local lvl4 = getLvl4()
    self.currentLevel = lvl4
    self.inLevel = true
    lvl4:start()   
  elseif level == "levelSelector" then
    self.inLevel = false
    local levelSelector = createLevelSelector()
    self.currentLevel = levelSelector
    self:resizeViewport(1280, 720)
    levelSelector:start()
  elseif level == "howToPlay" then
    self.inLevel = false
    local howToPlay = createHowToPlay()
    self.currentLevel = howToPlay
    howToPlay:start()
  end
end

function engine:destroyAllObject()
  for id, object in pairs(self.gameObjects.all) do
    self:deleteGameObject(object)
  end  
end

function engine:clearAll()
  self:destroyAllObject()
  for key, timer in pairs(promises) do
    timer:stop()
    timer = nil
  end
  self.input.touchPromise = nil
end

function engine:clearCache(target)
  if target then
    self.cache[target] = nil
  else
    for name, group in pairs(self.cache) do    
      self.cache[name] = nil
    end  
  end
end

function engine:isInFaction(gameObject, faction)
  if self.gameObjects.factions[faction] then
    return self.gameObjects.factions[faction][gameObject.id] ~= nil
  else
    return false
  end
end

function engine:removeFromFaction(gameObject, faction)
  if self.gameObjects.factions[faction] then
    self.gameObjects.factions[faction][gameObject.id] = nil
  end
end

function engine:getFaction(faction)
  return iif( self.gameObjects.factions[faction],
    self.gameObjects.factions[faction],
    {}
  )
end

function engine:mainToUi(x, y)
  return self.uiLayer:wndToWorld(self.mainLayer:worldToWnd(x, y))
end
