--[[ Create / handle UI here ]]--
function getGameUI()
  local spritePath = 'assets/sprites/ui/'
  local score = 0
  
  local gameUI = {
    name = "gameUI",
    huds = {
      scoreCounter = createHud(
        config.prefferedWidth / 11, 
        (config.prefferedHeight/1.1) * -1,
        "assets/sprites/ui/Achtergrond4.png", 
        128, 
        64
       )--[[,
      --timeCounter = createHud(
        xLocContainer, 
        yLocContainer, 
        imagePath, 
        width, 
        height)]]--
    },
    hudTexts = {
      scoreCounterText = createHudText(
        config.prefferedWidth / 11, 
        (config.prefferedHeight/1.1)*-1, 
        "Score: \n" .. score,
        28, 
        156, 
        92
       )
      --timeCounterText = createHudText(),
    },    
    buttons = {
      --penguinSpawnButton = createGameUIButton(x, y, path, spawnCallback),
      --placeJumpBoostButton = createGameUIButton(x, y, path, jumpBoostCallback),
      --menuButton = createGameUIButton(x, y, path, menuCallback)
    }
  }
  
  function gameUI:start()
    print("Loading GameUI!")
    for keys, object in pairs(self.buttons) do
      print("Found object, add it to game")
      --print("name: " .. object)
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.huds) do
      print("Found object, add it to game")
      --print("name: " .. object.name)
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.hudTexts) do
      print("Found object, add it to game")
      --print("name: " .. object)
      engine:addGameObject(object)
    end
  end
  
  function gameUI:update()
    self.huds.scoreCounter:updateInfo(score)
    self.huds.timerCounter:updateInfo(time)
  end
  
  function gameUI:destroy()
    engine:destroyAllObject()
  end
  
  return gameUI
end

function createHud(xLocContainer, yLocContainer, imagePath, width, height)
  hudContainer = createDrawableGameObject(
    xLocContainer, 
    yLocContainer
  )
  table.insert(hudContainer.factions, "ui")
  
  hudContainer.name = "hudContainer"
  hudContainer.width = width
  hudContainer.height = height
  
  local hudContainerImage = engine:loadImageTexture(imagePath)
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( hudContainerImage )
  quad:setRect(-(width/2), -(height/2), (width/2), (height/2) )

  hudContainer.prop = MOAIProp2D.new()
  hudContainer.prop:setDeck(quad)
  hudContainer.prop:setScl(1.5, 1.5)
  hudContainer.prop:setLoc(
    hudContainer.x, 
    hudContainer.y
  )
  
  return hudContainer
end

function createHudText(xLocText, yLocText, string, fontSize, width, height)
  hudText = createDrawableGameObject(
    xLocText, 
    yLocText
  )
  table.insert(hudText.factions, "ui")
  hudText.name = "hudText"
  
  --create hud text
  local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
  local font = MOAIFont.new()
  font:load( 'assets/fonts/BNMachine.ttf' )
  font:preloadGlyphs( charCodes, 24 )
  
  hudText.prop = MOAITextBox.new()
  hudText.prop:setStyle( newFontStyle( font, fontSize ) )
  hudText.prop:setString( string )
  hudText.prop:spool()
  hudText.prop:setRect(-(width/2), -(height/2), (width/2), (height/2) )
  hudText.prop:setLoc(
    hudText.x, 
    hudText.y
  )
  hudText.prop:setAlignment(
    MOAITextBox.CENTER_JUSTIFY, 
    MOAITextBox.CENTER_JUSTIFY 
  )
  hudText.prop:setYFlip( true )
  
  function hudText:updateInfo(value)
    hudText:setString(value)
  end
  
  return hudText
end

function createGameUIButton(x, y, path, callback)
  --create button object
  Button = createDrawableGameObject(x, y)
  onTouchCallback = callback
  table.insert(Button.factions, "touchables")
  table.insert(Button.factions, "ui")

  Button.name = "uiButton"
  
  function Button:onTouch(callback)
    callback()
  end
end

function jumpBoostCallback()
  
end

function menuCallback()
  
end

function jumpBoostCallback()
  
end