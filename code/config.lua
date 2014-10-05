--[[--
  This file should only exist as an object container all configurable 
--]]--

print('Loading config...')

config = {
  gameTitle = 'Waddle Squad',
 
  --viewport
  screenWidth = 1280,
  screenHeight = 720,
  prefferedWidth = 1280,
  prefferedHeight = 720,
  
  --startup settings
  showSplashScreen = false,
  startStage = 'lvl1',
  
  --box2D
  gravityX = 0,
  gravityY = -9.8,
  unitToMeter = 1/30, 
  debug2DDraw = false,
  debugSpriteDraw = true,
  
  --penguin settings
  penguinSpeed = 5,
  penguinForceX = 10,
  penguinForceY = 7,
  penguinFriction = 0,
  
  --settings
  muteSound = false,
  leftyFlip = false,
  
  splashScreenFinished = false
}