function getMainMenu(x, y)
  
  local mainMenu = createDrawableGameObject(x, y)
  
  table.insert(mainMenu.factions, 'menus')
  
  print('Loading main menu...')

  function mainMenu:start()
    print('Main menu started!')
    if engine.factions.menus.splashScreen ~= nil then
      engine:removeGameObject(menus.splashScreen)
    end
  end
  
end