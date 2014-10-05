--[[--
  This file should only exist as an object container all configurable 
--]]--

print('Loading config...')

config = {
  gameTitle = 'Waddle Squad',
 
  --viewport
  screenWidth = 640,
  screenHeight = 360,
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
  penguinSpeed = 60,
  penguinJumpForce = 8,
  penguinFriction = 0,
  
  --settings
  muteSound = false,
  leftyFlip = false,
  
  splashScreenFinished = false
  
}