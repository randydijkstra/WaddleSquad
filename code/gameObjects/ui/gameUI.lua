--[[ Create / handle UI here ]]--
function getGameUI()  
  
  gameUI = {
    name = "gameUI",
    huds = {
      scoreCounter = createHud(
        config.prefferedWidth / 11, 
        (config.prefferedHeight/1.1) * -1,
        "assets/sprites/ui/Achtergrond4.png", 
        128, 
        64
      ),
      timeCounter = createHud(
        config.prefferedWidth / 2, 
        (config.prefferedHeight/ 11) * -1,
        "assets/sprites/ui/Achtergrond4.png", 
        128, 
        64
      )
    },
    hudTexts = {
      scoreCounterText = createHudText(
        config.prefferedWidth / 11, 
        (config.prefferedHeight/1.105)*-1, 
        "Score: \n" .. gameStats.score,
        32, 
        156, 
        92,
        true
       ),
       timeCounterText = createHudText(
        config.prefferedWidth / 2, 
        (config.prefferedHeight/11)*-1, 
        tostring(engine.gameStats.time),
        50, 
        128, 
        64,
        true  
      )
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
    self.huds.scoreCounter:updateInfo(gameStats.score)
    self.huds.timerCounter:updateInfo(gameStats.time)
    --gameStats.score = gameStats.score + 1
    print(gameStats.score)
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

function createHudText(xLocText, yLocText, string, fontSize, width, height, whiteColor)
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
  
  if whiteColor == true then
    local fontStyle = MOAITextStyle.new()
    fontStyle:setFont( font )
    fontStyle:setSize( fontSize )
    fontStyle:setColor( 1,1,1,1 )  
    hudText.prop:setStyle(fontStyle)
  end
    
  function hudText:updateInfo(value)
    self.prop:setString("Score: \n"..value)
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