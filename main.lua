--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen

if config.showSplashScreen then
  local splashScreen = getSplashScreen()
  splashScreen:start() 
else
  local levelSelector = createLevelSelector()
  levelSelector:start()
end