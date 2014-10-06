engine = {
  mainViewport,
  uiViewPort,
  mainLayer,
  menuLayer,
  uiLayer,
  camera, -- handels what part can be vieuwed
  gameObjects = {
      all = {},
      factions = {
        penguins = {},
        update = {}, -- every object in this faction gets it's update() called
        moveable = {}, -- every object that should have it's move called
        staticSprites = {},
        menus = {},
        ui = {},
        touchables = {}
      },
  },
  box2DWorld,
  currentLevel = false, -- contains either false if no level is loaded or the current level
  uiIsActive = false,
  quads = {}, -- current loaded quads
  tileDecks = {}, -- current loaded tilesets,
  imageTextures = {}, -- current loaded image textures
  input,
  inLevel, -- variable to check if a level is being played
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
  for id, gameObject in pairs(self.gameObjects.factions.moveable) do
    gameObject.body:resetMassData()
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
    if gameObject.name == "hudContainer" or gameObject.name == "hudText" or gameObject.name == "uiButton" then
      self.uiLayer:insertProp(gameObject.prop)
      print("added to UI layer! " .. gameObject.name)
    else
      self.mainLayer:insertProp(gameObject.prop)
    end
  end  

  return gameObject
end

function engine:deleteGameObject(gameObject)
  
  self.gameObjects.all[gameObject.id] = nil
  
  if gameObject.factions then
    for key, value in pairs(gameObject.factions) do
      self.gameObjects.factions[value][gameObject.id] = nil
    end
  end
  
  if gameObject.prop then
    self.mainLayer:removeProp(gameObject.prop)    
  end
  
  if gameObject.body then
    gameObject.body:destroy()
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

function engine:resizeViewport(width, height)
  
  print("resize to: "..width..","..height)
  
  self.viewport:setScale(width, height)
end

function engine:loadLevel(level)
  if self.currentLevel then
    self.currentLevel:destroy()
  end
  
  if self.uiIsActive then
    self.uiIsActive:destroy()
  end
  
  print("loading: " .. level)
  
  if level == "level1" then
    local lvl1 = getLvl1()
    self.currentLevel = lvl1
    self.inLevel = true
    lvl1:start()
    local gameUI = getGameUI()
    self.uiIsActive = gameUI
    gameUI:start()
  elseif level == "level2" then
    local lvl2 = getLvl2()
    self.currentLevel = lvl2
    self.inLevel = true
    lvl2:start()
    local gameUI = getGameUI()    
    self.uiIsActive = gameUI
    gameUI:start()
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
    levelSelector:start()
  end
end

function engine:destroyAllObject()
  for id, object in pairs(self.gameObjects.all) do
    self:deleteGameObject(object)
  end
end

print('engine loaded')