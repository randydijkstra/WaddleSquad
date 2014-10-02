function getSplashScreen()
  local splashScreen = {}
  -- Do this at loadtime
  charCodes = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!?@#$%^&*()_'
  font = MOAIFont.new()
  font:load( 'assets/fonts/BNMachine.ttf' )
  font:preloadGlyphs( charCodes, 24 )

  -- Do this at rendertime
  -- Load text...
  textBox = MOAITextBox.new()
  textBox:setStyle( newFontStyle( font, 45 ) )
  textBox:setString( 'Sharkbear Studios presents...' )
  textBox:spool()
  textBox:setRect( -256, -128, 256, 128 )
  textBox:setLoc(
    config.prefferedWidth / 2, 
    (config.prefferedHeight / 2) * -1
  )
  textBox:setAlignment(
    MOAITextBox.CENTER_JUSTIFY, 
    MOAITextBox.CENTER_JUSTIFY 
  )
  textBox:setYFlip( true )
  
  --Load sprites
  
  spritePath = 'assets/sprites/logos/'
  
  -- SB studios logo
  textureLogo = MOAIImageTexture.new()
  textureLogo:load( spritePath .. 'Logo2.png' )
  textureLogo:invalidate()
  
  quadLogo = MOAIGfxQuad2D.new()
  quadLogo:setTexture( textureLogo )
  quadLogo:setRect(
    -(textureLogo:getSize(width)/2), 
    -(textureLogo:getSize(height)/2), 
    (textureLogo:getSize(width)/2), 
    (textureLogo:getSize(height)/2)
  )

  sblogo = MOAIProp2D.new()
  sblogo:setDeck(quad)
  sblogo:setScl(1, 1)
  sblogo:setLoc(
    config.prefferedWidth/2, 
    (config.prefferedHeight / 2) * -1
  )

  -- Waddle squad logo
  texture = MOAIImageTexture.new()
  texture:load( spritePath .. 'Logo-full.png' )
  texture:invalidate()
  
  local quad = MOAIGfxQuad2D.new()
  quad:setTexture( texture )
  quad:setRect(
    -64, 
    -32, 
    64, 
    32
  )

  wslogo = MOAIProp2D.new()
  wslogo:setDeck(quad)
  wslogo:setScl(6, 6)
  wslogo:setLoc(
    config.prefferedWidth/2, 
    (config.prefferedHeight / 2) * -1
  )

  wslogo:setColor ( 0, 0, 0, 0 ) -- R, G, B, A 
  --Moai uses premultiplied alpha, so to fade to nothing: 
  
  function splashScreen:start()
    function callback()
      textBox:seekColor ( 1, 1, 1, 0, 0.8)
      wslogo:seekColor ( 1, 1, 1, 1, 4 ) 
      
      function callback()   
        
        createStartMenu()
      end
      
      local promise = createPromise(1, callback)
      
   
    end
    
    engine.mainLayer:insertProp( sblogo )
    engine.mainLayer:insertProp( wslogo )
    engine.mainLayer:insertProp( textBox )
    
    local promise = createPromise(2, callback)
  end
  
  function createStartMenu()
    wslogo:moveScl(-0.5, -0.5, 1, 3, MOAIEaseType.EASE_IN)
    wslogo:seekLoc(
      config.prefferedWidth / 2, 
      (config.prefferedHeight / 2.5) * -1,
      1,
      1.5,
      MOAIEaseType.EASE_IN
    )
    textBox:setString( 'Touch to play!' )
    textBox:setLoc(
      config.prefferedWidth / 2, 
      (config.prefferedHeight / 1.30) * -1
    )
    textBox:seekColor ( 0, 0, 0, 1, 2)
    
    function startGameCallback()
      config.splashScreenFinished = true
    end
  
    local startGamePromise = createPromise(1.5, startGameCallback) 
  end

  engine.currentLevel = splashScreen
  return splashScreen
end