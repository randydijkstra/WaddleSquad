--[[--
  This file should only exist as an object container all configurable 
--]]--

config = {
  gameTitle = 'Waddle Squad',
  gameVersion = "Alpha v1.6\nDemo",
  launchOnMobile = false,
 
  --viewport
  screenWidth = 1280,
  screenHeight = 720,
  prefferedWidth = 1280,
  prefferedHeight = 720,
  
  --startup settings
  amountOfLevels = 5,
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
    jumpBoostSensor = 32,
    waterBoost = 64,
    waterBoostPlatform = 128,
    water = 256,
  }, -- should be power of two
  
  --penguin settings
  penguinSpeed = 75,
  penguinJumpForce = 7.3,
  penguinFriction = 0,
  penguinAnimationSpeed = 0.15,
  jumpBoostSpeed = 15,
  maxSpeed = 300,
  penguinSpawnCost = 100,
  penguinFinishedPoints = 200,
  
  --special settings
  snowflakesmallPoints = 25,
  snowflakebigPoints = 50,
  jumpBoostCost = 75,
  crossWaterCost = 50,
  
  --level settings
  levelStartTime = { --startTime for Levels in seconds
    lvl1 = 80,
    lvl2 = 95,
    lvl3 = 90,
    lvl4 = 90,
    lvl5 = 100
  },
  penguinStartPosition = {
    lvl1 = { x = -35, y = -400 },
    lvl2 = { x = -35, y = -395 },
    lvl3 = { x = -35, y = -520 },
    lvl4 = { x = -35, y = -650 },
    lvl5 = { x = -35, y = -775 },
  },
  
  --general
  leftyFlip = false,
  defaultAnimationSpeed = 0.15,
  SSanimationDuration = 4, --amount of time viewed in sec
  
  useTextureLoad = false, -- disabling this will fix transparacy but drops performence greatly (textures need to be read for every call)
  
  splashScreenFinished = false
}