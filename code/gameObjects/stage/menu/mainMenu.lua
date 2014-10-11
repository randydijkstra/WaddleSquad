function getMainMenu(x, y)
  
  local mainMenu = createDrawableGameObject(x, y)
  
  table.insert(mainMenu.factions, 'menus')

  function mainMenu:start()

    if engine.factions.menus.splashScreen ~= nil then
      engine:removeGameObject(menus.splashScreen)
    end
  end
  
end