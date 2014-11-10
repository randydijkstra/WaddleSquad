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
   
    engine:playMusic('assets/sounds/music/Intro.wav', 0.8)
    engine.input.states.locked = true

    engine:addGameObject(self.textBox)
    engine:addGameObject(self.wsLogo)
    engine:addGameObject(self.versionTextBox)
    
    local promise = createPromise(2, function()
      splashScreen.textBox.prop:seekColor ( 1, 1, 1, 0, 0.8)
      splashScreen.wsLogo.prop:seekColor ( 1, 1, 1, 1, 4 ) 
      
      local promise = createPromise(1, function()
        splashScreen:createStartMenu()   
        
        local tileDeck = engine:loadQuad("assets/sprites/penguin/static.png", 64, 64)
              
        local peng = engine:addGameObject(createDrawableGameObject(config.prefferedWidth+45, config.prefferedHeight * -0.5, tileDeck))
        peng.prop:setRot(90)
        peng.prop:seekLoc(config.prefferedWidth + 10, config.prefferedHeight * -0.5, 2)
        createPromise(1, function()
          engine:playSound("assets/sounds/quack.wav")
        end)
        
        createPromise(1, function() 
          local tileDeck = engine:loadQuad(
            "assets/sprites/penguin/static.png", 64, 64
          )
              
          local peng = engine:addGameObject(
            createDrawableGameObject(
              config.prefferedWidth /2, 
              0 + 64, 
              tileDeck
            )
          )
          peng.prop:setRot(180)
          peng.prop:seekLoc(config.prefferedWidth / 2, 10, 2)
          createPromise(1, function()
            engine:playSound("assets/sounds/quack.wav")
          end)
          
          createPromise(1, function() 
            local tileDeck = engine:loadQuad(
              "assets/sprites/penguin/static.png", 128, 128
            )
                
            local peng = engine:addGameObject(
              createDrawableGameObject(
                config.prefferedWidth / 2, (config.prefferedHeight * -1) - 128, 
                tileDeck
              )
            )
         
            peng.prop:seekLoc(config.prefferedWidth / 2 - 64, (config.prefferedHeight * -1) - 16, 2)
            createPromise(1, function()
              engine:playSound("assets/sounds/quack.wav")
            end)
          end)
        end)
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
        --  engine:playMusic('assets/sounds/music/Level Select.wav', 0.8)
        if engine.storage:get("firstLaunch", "config") == false then --Check if first boot
          engine:loadLevel('levelSelector') -- If not first boot, load level selector
        else
          engine.storage:set(false, "firstLaunch", "config") -- If first boot, set boolean
          engine:loadLevel('howToPlay') -- If first boot,  load how to play
        end
      end)
        
      engine.input.locked = false  
    end) 
  end

  function splashScreen:destroy()  
    engine:clearAll()
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