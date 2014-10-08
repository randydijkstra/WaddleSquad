function getSplashScreen()
  splashScreen = {
    name = "splashScreen",
    textBox = createTextBox(
      config.prefferedWidth/2, (config.prefferedHeight / 2) * -1,
      512, 256,
      'Sharkbear Studios presents...',
      45
    ),
    versionTextBox = createTextBox(
      config.prefferedWidth / 1.1, (config.prefferedHeight / 1.1) * -1,
      200, 200,
      config.gameVersion,
      30
    ),
    wsLogo = createWsLogo()
  }
  splashScreen.versionTextBox.prop:setColor ( 0, 0, 0, 0 ) -- R, G, B, A Color setting should be done when color parameter is in textBox
  
  function splashScreen:start()
   
    engine.input.states.locked = true

    engine:addGameObject(self.textBox)
    engine:addGameObject(self.wsLogo)
    engine:addGameObject(self.versionTextBox)
    
    local promise = createPromise(2, function()
      splashScreen.textBox.prop:seekColor ( 1, 1, 1, 0, 0.8)
      splashScreen.wsLogo.prop:seekColor ( 1, 1, 1, 1, 4 ) 
      
      local promise = createPromise(1, function()
        splashScreen:createStartMenu()   
      end)
            
    end)
  end
  
  function splashScreen:createStartMenu()
    splashScreen.wsLogo.prop:moveScl(-0.5, -0.5, 1, 3, MOAIEaseType.EASE_IN)
    splashScreen.wsLogo.prop:seekLoc(
      config.prefferedWidth / 2 - 384, 
      (config.prefferedHeight / 2.5) * -1 - 192,
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
    splashScreen.versionTextBox.prop:seekColor ( 0, 0, 0, 0.5, 2)
  
    local startGamePromise = createPromise(1.5, function()
        
      engine.input:setTouchPromise(function()
        engine:loadLevel('levelSelector')
      end)
        
      engine.input.locked = false  
    end) 
  end

  function splashScreen:destroy()  
    engine:destroyAllObject()
  end

  engine.currentLevel = splashScreen
  return splashScreen
end

function createWsLogo()
  
  local deck = engine:loadQuad('assets/sprites/logos/Logo-full.png', 128, 64)
  
  wsLogo = createDrawableGameObject(
    config.prefferedWidth / 2 - 768, 
    (config.prefferedHeight / 2) * -1 - 384,
    deck
  )

  wsLogo.prop:setScl(6, 6)
  wsLogo.prop:setColor ( 0, 0, 0, 0 ) -- R, G, B, A 
  
  return wsLogo
end