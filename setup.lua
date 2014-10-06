--[[--
  after all code files are loaded we will setup the viewport and handle devices here
--]]--

print('Title of the game is: '..config.gameTitle)

if not initialized then
  MOAISim.openWindow(
    config.gameTitle, 
    config.screenWidth, 
    config.screenHeight
  )
   
  local viewport = MOAIViewport.new()
  viewport:setSize(config.screenWidth, config.screenHeight)
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
  
  local viewport2 = MOAIViewport.new()
  viewport2:setSize(config.screenWidth, config.screenHeight)
  viewport2:setScale(config.prefferedWidth, config.prefferedHeight)
  viewport2:setOffset(-1, 1)
  
  engine.uiViewport = viewport2
  
  local uiLayer = MOAILayer2D.new()
  uiLayer:setViewport(engine.uiViewport)
  uiLayer:setCamera(engine.camera)
  MOAISim.pushRenderPass(uiLayer)
  
  engine.uiLayer = uiLayer
  
  local world = MOAIBox2DWorld.new ()
  world:setGravity( config.gravityX, config.gravityY)
  world:setUnitsToMeters( config.unitToMeter )
  world:setDebugDrawEnabled(config.debug2DDraw)
  
  engine.mainLayer:setBox2DWorld( world )
  engine.box2DWorld = world
  
  engine:start()
end