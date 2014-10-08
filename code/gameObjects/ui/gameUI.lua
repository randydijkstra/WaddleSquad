--[[ Create / handle UI here ]]--
function getGameUI()  
  
  local gameUI = createGameObject()
  table.insert(gameUI.factions,"update")
  
  gameUI.name = "gameUI"
  gameUI.huds = {
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
  }
  gameUI.hudTexts = {
    scoreCounterText = createHudText(
      config.prefferedWidth / 11, 
      (config.prefferedHeight/1.105)*-1, 
      "Score: \n" .. engine.gameStats.score,
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
  } 
  gameUI.buttons = {
    penguinSpawnButton = createGameUIButton(
      config.prefferedWidth / 10 * 8,
      (config.prefferedHeight/1.03) * -1,
      64,
      64,
      "assets/sprites/ui/Spawn.png", 
      spawnCallback)
    --placeJumpBoostButton = createGameUIButton(x, y, path, jumpBoostCallback),
    --menuButton = createGameUIButton(x, y, path, menuCallback)
  }
  
  function gameUI:start()
    for keys, object in pairs(self.huds) do
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.hudTexts) do
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
  end
  
  --At the moment not used at all
  function gameUI:update()
    --self.huds.scoreCounter:updateInfo(engine.gameStats.score)
    --self.huds.timerCounter:updateInfo(engine.gameStats.time)
    --gameStats.score = gameStats.score + 1
    --print(engine.gameStats.score)
  end
  
  function gameUI:onDestroy()
    engine.uiIsActive = false
  end
  
  engine.uiIsActive = true
  return gameUI
end

function createHud(xLocContainer, yLocContainer, imagePath, width, height)
  local hudContainer = createDrawableGameObject(
    xLocContainer, 
    yLocContainer
  )
  table.insert(hudContainer.factions, "ui")
  
  print('spawn button')
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
  local hudText = createDrawableGameObject(
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
    self.prop:setString(value)
  end
  
  return hudText
end

function createGameUIButton(x, y, width, height, path, callback)
  --create button object
  local button = createDrawableGameObject(x, y)
  button.callback = callback
  table.insert(button.factions, "touchables")
  table.insert(button.factions, "ui")

  button.name = "uiButton"
  
  local xScale = 1.5
  local yScale = 1.5
  button.width = width * xScale
  button.height = height * yScale
    
  local buttonTexture = engine:loadImageTexture(path)
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( buttonTexture )
  quad:setRect(
    0, 0, width, height 
  )

  button.prop = MOAIProp2D.new()
  button.prop:setDeck(quad)
  button.prop:setScl(xScale, yScale)
  button.prop:setLoc(
    button.x, 
    button.y
  )
  
  function button:onTouch(x, y)
    self.callback()
  end
  
  return button
end

function afterLevelOverlay()
  
end

function spawnCallback()
  --Some if statements to limit spawn amount
  penguin = engine:addGameObject(createPenguin(-50, -350))
end

function menuCallback()
  
end

function jumpBoostCallback()
  
end