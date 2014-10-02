--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen
splashScreen = getSplashScreen(0, 0)
splashScreen:start()

--Launch main menu
--[[function callBack()
  mainMenu = getMainMenu(0, 0)
  mainMenu:start()
end]]--

lvl1 = nil

--lvl1 = getLvl1()
--lvl1:start()