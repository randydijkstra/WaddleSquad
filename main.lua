--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen

if config.showSplashScreen then
  getSplashScreen():start() 
else
  createLevelSelector():start()
end