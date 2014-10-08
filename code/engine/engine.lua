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
  quads = {}, -- current loaded quads
  tileDecks = {}, -- current loaded tilesets,
  imageTextures = {}, -- current loaded image textures
  input,
  inLevel = false, -- variable to check if a level is being played
  fonts = {}, -- table that hold all loaded fonts
}
engine.__index = engine

function engine:start()
  print('Starting engine')

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

function engine:cameraController()
  
end

function engine:heartBeat()  
    
  for id, gameObject in pairs(self.gameObjects.factions.update) do
    gameObject:update()
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

function engine:getNewId (params)
  id = math.random(9001)
  
  while self.gameObjects.all[id] do 
    id = math.random(9001)
  end
  
  return id;
end

function engine:loadQuad(path, xMin, yMin, xMax, yMax)
  if self.quads[path] then
    return self.quads[path]
  end
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture(path)
  quad:setRect(xMin, yMin, xMax, yMax)
 
  self.quads[path] = quad
  
  return quad
end

function engine:activateMoveAbleGameObjects()
  
  -- Doesn't work (the setActive call) atm and no idea why

  for id, gameObject in pairs(self.gameObjects.factions.moveable) do
    if gameObject.body then
      gameObject.body:setActive(true)
    else
      print("Object "..id.."Has no body")
    end
  end
end


function engine:loadTileDeck(path, deckXRows, deckYRows, xMin, yMin, xMax, yMax)  
  
  if self.tileDecks[path] then
    return self.tileDecks[path]
  end
  
  --print("Loading texture: "..path.." "..deckXRows.." "..deckYRows.." "..xMin.." "..yMin.." "..xMax.." "..yMax)
  
  local tileDeck = MOAITileDeck2D.new()
  tileDeck:setTexture(path)
  tileDeck:setSize(deckXRows, deckYRows)
  tileDeck:setRect( xMin, yMin, xMax, yMax )
  
  self.tileDecks[path] = tileDeck
  
  return tileDeck
end

function engine:loadImageTexture(path)  
  
  if self.imageTextures[path] then
    return self.imageTextures[path]
  end
  
  local texture = MOAIImageTexture.new()
  texture:load( path )
  texture:invalidate() -- power of two thingy
  
  self.imageTextures[path] = texture
  
  return texture
end

function engine:loadFontStyle(path, size)

  local font
  if self.fonts[path] then
    font = self.fonts[path]
  else
    local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
    font = MOAIFont.new()
    font:load( path )
    font:preloadGlyphs( charCodes, 24 )
  end

  local fontStyle = MOAITextStyle.new()
  fontStyle:setFont( font )
  fontStyle:setSize( size )
  fontStyle:setColor( 0,0,0,1 )

  return fontStyle
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
  end
end

function engine:destroyAllObject()
  for id, object in pairs(self.gameObjects.all) do
    self:deleteGameObject(object)
  end
end

function engine:isInFaction(gameObject, faction)
  if self.gameObjects.factions[faction] then
    return self.gameObjects.factions[faction][gameObject.id] ~= nil
  else
    return false
  end
end

print('engine loaded')