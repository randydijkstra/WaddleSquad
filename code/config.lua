--[[--
  This file should only exist as an object container all configurable 
--]]--

print('Loading config...')

config = {
  gameTitle = 'Waddle Squad',
  gameVersion = "Alpha v1.0",
 
  --viewport
  screenWidth = 1280,
  screenHeight = 720,
  prefferedWidth = 1280,
  prefferedHeight = 720,
  
  --startup settings
  showSplashScreen = true,
  startStage = 'lvl1',
  
  --box2D
  gravityX = 0,
  gravityY = -9.8,
  unitToMeter = 1/30, 
  debug2DDraw = true,
  debugSpriteDraw = true,
  
  --penguin settings
  penguinSpeed = 60,
  penguinJumpForce = 7,
  penguinFriction = 0,
  penguinAnimationSpeed = 0.15,
  
  --general
  muteSound = false,
  leftyFlip = false,
  
  useTextureLoad = false, -- disabling this will fix transparacy but drops performence greatly (textures need to be read for every call)
  
  splashScreenFinished = false
}

defaultGameStats = {
  levelStartTime = {
    --startTime for Levels in seconds
    lvl1 = 45,
    lvl2 = 60,
    lvl3 = 50,
    lvl4 = 60
  }
}