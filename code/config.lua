--[[--
  This file should only exist as an object container all configurable 
--]]--

config = {
  gameTitle = 'Waddle Squad',
  gameVersion = "Alpha v1.4\nDemo",
  launchOnMobile = false,
 
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
  smoothSquares = true,
  smoothness = 2,
  maskBits = {
    penguin = 1,
    iglo = 2,
    snowflake = 4,
    floor = 8,
    jumpBoost = 16,
    jumpBoostSensor = 32
  }, -- should be power of two
  
  --penguin settings
  penguinSpeed = 71,
  penguinJumpForce = 7.3,
  penguinFriction = 0,
  penguinAnimationSpeed = 0.15,
  jumpBoostSpeed = 15,
  maxSpeed = 300,
  
  --general
  leftyFlip = false,
  
  useTextureLoad = false, -- disabling this will fix transparacy but drops performence greatly (textures need to be read for every call)
  
  splashScreenFinished = false
}

defaultGameStats = {
  levelStartTime = {
    --startTime for Levels in seconds
    lvl1 = 75,
    lvl2 = 90,
    lvl3 = 90,
    lvl4 = 80
  },
  scores = {
    snowflakesmallPoints = 25,
    snowflakebigPoints = 50,
    penguinFinishedPoints = 200,
    penguinCost = -100,
    jumpBoostCost = -50
  }
}