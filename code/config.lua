--[[--
  This file should only exist as an object container all configurable 
--]]--

print('Loading config...')

config = {
  gameTitle = 'Waddle Squad',
  gameVersion = "Alpha v1.0",
 
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
  debug2DDraw = true,
  debugSpriteDraw = true,
  
  --penguin settings
  penguinSpeed = 60,
  penguinJumpForce = 7,
  penguinFriction = 0,
  
  --settings
  muteSound = false,
  leftyFlip = false,
  
  splashScreenFinished = false
}

levelStartTime = {
  --Time for Levels in seconds
  lvl1 = 30,
  lvl2 = 60,
  lvl3 = 50,
}

levelHighScores = {
  lvl1 = 900,
  lvl2 = 40,
  lvl3 = 0
}