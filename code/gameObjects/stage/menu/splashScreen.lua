function getSplashScreen()
  splashScreen = {
    textBox = createIntroText(),
    sbLogo = createSblogo(),
    wsLogo = createWsLogo()
  }
  
  function splashScreen:start()
    function afterText()
      splashScreen.textBox.prop:seekColor ( 1, 1, 1, 0, 0.8)
      splashScreen.wsLogo.prop:seekColor ( 1, 1, 1, 1, 4 ) 
      
      function afterlogo()   
        splashScreen:createStartMenu()
      end
      
      local promise = createPromise(1, afterlogo)
      
    end
    
    engine:addGameObject(self.textBox)
    --engine:addGameObject(self.sbLogo)
    engine:addGameObject(self.wsLogo)
    
    local promise = createPromise(2, afterText)
  end
  
  function splashScreen:createStartMenu()
    splashScreen.wsLogo.prop:moveScl(-0.5, -0.5, 1, 3, MOAIEaseType.EASE_IN)
    splashScreen.wsLogo.prop:seekLoc(
      config.prefferedWidth / 2, 
      (config.prefferedHeight / 2.5) * -1,
      1,
      1.5,
      MOAIEaseType.EASE_IN
    )
    splashScreen.textBox.prop:setString( 'Touch to play!' )
    splashScreen.textBox.prop:setLoc(
      config.prefferedWidth / 2, 
      (config.prefferedHeight / 1.30) * -1
    )
    splashScreen.textBox.prop:seekColor ( 0, 0, 0, 1, 2)
    
    function startGameCallback()
      config.splashScreenFinished = true
    end
  
    local startGamePromise = createPromise(1.5, startGameCallback) 
  end

  engine.currentLevel = splashScreen
  return splashScreen
end

function createIntroText()
    
  local introText = createDrawableGameObject(config.prefferedWidth / 2, (config.prefferedHeight / 2) * -1)
  
  local charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
  local font = MOAIFont.new()
  font:load( 'assets/fonts/BNMachine.ttf' )
  font:preloadGlyphs( charCodes, 24 )
  
  introText.prop = MOAITextBox.new()
  introText.prop:setStyle( newFontStyle( font, 45 ) )
  introText.prop:setString( 'Sharkbear Studios presents...' )
  introText.prop:spool()
  introText.prop:setRect( -256, -128, 256, 128 )
  introText.prop:setLoc(
    introText.x, 
    introText.y
  )
  introText.prop:setAlignment(
    MOAITextBox.CENTER_JUSTIFY, 
    MOAITextBox.CENTER_JUSTIFY 
  )
  introText.prop:setYFlip( true )
  
  return introText
end

function createSblogo()
  sbLogo = createDrawableGameObject(config.prefferedWidth / 2, (config.prefferedHeight / 2) * -1)
  
  -- SB studios logo
  local textureLogo = engine:loadImageTexture('assets/sprites/logos/Logo2.png')
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( textureLogo )
  quad:setRect(
    -(textureLogo:getSize(width)/2), 
    -(textureLogo:getSize(height)/2), 
    (textureLogo:getSize(width)/2), 
    (textureLogo:getSize(height)/2)
  )

  sbLogo.prop = MOAIProp2D.new()
  sbLogo.prop:setDeck(quad)
  sbLogo.prop:setScl(1, 1)
  sbLogo.prop:setLoc(
    config.prefferedWidth/2, 
    (config.prefferedHeight / 2) * -1
  )
  
  return sbLogo
end

function createWsLogo()
  
  wsLogo = createDrawableGameObject(
    config.prefferedWidth/2, 
    (config.prefferedHeight / 2) * -1
  )
  
  -- Waddle squad logo
  local squadLogo = engine:loadImageTexture('assets/sprites/logos/Logo-full.png')
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( squadLogo )
  quad:setRect(
    -64, 
    -32, 
    64, 
    32
  )
  
  wsLogo.prop = MOAIProp2D.new()
  wsLogo.prop:setDeck(quad)
  wsLogo.prop:setScl(6, 6)
  wsLogo.prop:setLoc(
    wsLogo.x, 
    wsLogo.y
  )
  wsLogo.prop:setColor ( 0, 0, 0, 0 ) -- R, G, B, A 
  --Moai uses premultiplied alpha, so to fade to nothing: 
  
  return wsLogo
end