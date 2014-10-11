function createHowToPlay()
  
  local howToPlay = {
    name = "tutorialScreen",
    textBoxes = {
      screen1TextBox = createTextBox(
        config.prefferedWidth/2, (config.prefferedHeight / 2.5) * -1,
        720, 256,
        'Bring Leroy and his nephews to the igloo!\nTap on the screen to make all penguins jump.',
        30
      ),
      screen2TextBox1 = createTextBox(
        config.prefferedWidth/2, (config.prefferedHeight / 2) * -1,
        512, 256,
        'Collect the snowflakes in order to hire the Waddle Squad!',
        45
      ),
      screen2TextBox2 = createTextBox(
        config.prefferedWidth/2, (config.prefferedHeight / 2) * -1,
        512, 256,
        'Sharkbear Studios presents...',
        45
      ),
    },
    tutorialScreens = {
      screen1 = createTutorialScreen(
        "assets/sprites/ui/Tutorial01v2.png", 
        config.prefferedWidth,
        config.prefferedHeight
      ),
      screen2 = createTutorialScreen(
        "assets/sprites/ui/Tutorial02v2.png",
        config.prefferedWidth,
        config.prefferedHeight
      )
    }
  }
  print("create how to play")
  
  function howToPlay:start()
    -- show first screen
    print("Screen 1")
    engine:addGameObject(self.tutorialScreens.screen1)
    engine:addGameObject(self.textBoxes.screen1TextBox)

    
    engine.input:setTouchPromise(function()
      -- show second screen
      print("Screen 2")
      engine:deleteGameObject(self.textBoxes.screen1TextBox)
      engine:addGameObject(self.tutorialScreens.screen2)
      engine:addGameObject(self.textBoxes.screen2TextBox1)

      engine.input:setTouchPromise(function()
        -- Load level selector
        engine:loadLevel('levelSelector')
      end)
    end)  
  end
  
  function howToPlay:destroy()
    engine:destroyAllObject()
  end
  
  return howToPlay
end

function createTutorialScreen(path, width, height)
  print("width " .. width .. " height " .. height)
  deck = engine:loadQuad(path, width, height)
  
  --print("loc x"..config.prefferedWidth .. " height "..config.prefferedHeight) 
  
  tutorialScreen = createDrawableGameObject(
    0,
    config.prefferedHeight * -1,
    deck
  )
  
  return tutorialScreen
end