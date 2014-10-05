--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen
splashScreen = getSplashScreen()
splashScreen:start()

--Launch Levelselector
--levelSelector = createLevelSelector()
--levelSelector:start()