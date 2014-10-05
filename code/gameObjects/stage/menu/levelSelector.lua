function createLevelSelector()
    
  local levelSelector = createDrawableGameObject(x, y)
  table.insert(splashScreen.factions, 'menus')
  
  function selectedLevel(levelName)
    if levelName == "level1" then
      currentLevel = getLvl1()
    elseif levelName == "level2" then
      currentLevel = getLvl2()
    end
  end
end