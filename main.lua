--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen

if config.showSplashScreen then
  getSplashScreen():start() 
  --engine.storage:reset()  -- Uncomment to reset data
else
  createLevelSelector():start()
end