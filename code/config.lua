--[[--
  This file should only exist as an object container all configurable 
--]]--

config = {
  gameTitle = 'Waddle Squad',
  gameVersion = "Alpha v1.2\nDemo",
  launchOnMobile = true,
 
  --viewport
  screenWidth = 1280,
  screenHeight = 720,
  prefferedWidth = 1280,
  prefferedHeight = 720,
  
  --startup settings
  amountOfLevels = 3,
  showSplashScreen = true,
  startStage = 'lvl1',
  
  --box2D
  gravityX = 0,
  gravityY = -9.8,
  unitToMeter = 1/30, 
  debug2DDraw = false,
  debugSpriteDraw = true,
  smoothSquares = false,
  
  --penguin settings
  penguinSpeed = 70,
  penguinJumpForce = 7,
  penguinFriction = 0,
  penguinAnimationSpeed = 0.15,
  jumpBoostSpeed = 14,
  
  --general
  muteSound = false,
  leftyFlip = false,
  
  useTextureLoad = false, -- disabling this will fix transparacy but drops performence greatly (textures need to be read for every call)
  
  splashScreenFinished = false
}

defaultGameStats = {
  levelStartTime = {
    --startTime for Levels in seconds
    lvl1 = 65,
    lvl2 = 75,
    lvl3 = 70,
    lvl4 = 70
  },
  scores = {
    snowflakesmallPoints = 25,
    snowflakebigPoints = 50,
    penguinFinishedPoints = 200,
    penguinCost = -100,
    jumpBoostCost = -50
  }
}