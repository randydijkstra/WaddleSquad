--[[--
  after all code files are loaded we will setup the viewport and handle devices here
--]]--

print('Title of the game is: '..config.gameTitle)

if not initialized then
  viewportWidth, viewportHeight = MOAIGfxDevice.getViewSize()
  
  if config.launchOnMobile == false then
    --overwrite data to ensure launch
    viewportWidth = config.screenWidth
    viewportHeight = config.screenHeight
  end
  
  MOAISim.openWindow(
    config.gameTitle, 
    viewportWidth, 
    viewportHeight
  )
  
  local viewport = MOAIViewport.new()
  viewport:setSize(viewportWidth, viewportHeight)
  viewport:setScale(config.prefferedWidth, config.prefferedHeight)
  viewport:setOffset(-1, 1)
    
  engine.viewport = viewport
  
  local camera = MOAICamera2D.new()
  camera:setNearPlane(1)
  camera:setFarPlane(-2)
  
  engine.camera = camera
  
  local layer = MOAILayer2D.new()
  layer:setViewport(engine.viewport)
  layer:setCamera(engine.camera)
  MOAISim.pushRenderPass(layer)
  
  engine.mainLayer = layer
  
  local uiViewport = MOAIViewport.new()
  uiViewport:setSize(viewportWidth, viewportHeight)
  uiViewport:setScale(config.prefferedWidth, config.prefferedHeight)
  uiViewport:setOffset(-1, 1)
  
  engine.uiViewport = uiViewport 
  
  local uiLayer = MOAILayer2D.new()
  uiLayer:setViewport(engine.uiViewport)
  MOAISim.pushRenderPass(uiLayer)
  
  engine.uiLayer = uiLayer
  
  local world = MOAIBox2DWorld.new ()
  world:setGravity( config.gravityX, config.gravityY)
  world:setUnitsToMeters( config.unitToMeter )
  world:setDebugDrawEnabled(config.debug2DDraw)
  
  engine.mainLayer:setBox2DWorld( world )
  engine.box2DWorld = world
  
  engine.storage = createStorage()
  engine.storage:load()
  
  engine:start()
end