function createHowToPlay()
  
  local howToPlay = {
    name = "tutorialScreen",
    textBoxes = {
      screen1TextBox = createTextBox(
        config.prefferedWidth/2, (config.prefferedHeight / 2.5) * -1,
        720, 256,
        'Bring Leroy and his nephews to the igloo.\nTap on the screen to make all penguins jump.',
        30
      ),
      screen2TextBox1 = createTextBox(
        config.prefferedWidth/10 * 6, (config.prefferedHeight / 3.3) * -1,
        450, 100,
        'Collect the snowflakes in order to hire the Waddle Squad!',
        30
      ),
      screen2TextBox2 = createTextBox(
        config.prefferedWidth/10 * 3.5, (config.prefferedHeight / 1.8) * -1,
        350, 200,
        'Place Gunter to make Leroy jump.',
        20
      ),
      screen2TextBox3 = createTextBox(
        config.prefferedWidth/10 * 3.5, (config.prefferedHeight / 1.3) * -1,
        350, 200,
        'Place Barbara to make Leroy run.',
        20
      ),
      screen2TextBox4 = createTextBox(
        config.prefferedWidth/10 * 7.4, (config.prefferedHeight / 1.8) * -1,
        350, 100,
        'Place Shawn to dig.',
        20
      ),
      screen2TextBox5 = createTextBox(
        config.prefferedWidth/10 * 8.2, (config.prefferedHeight / 1.3) * -1,
        390, 100,
        'Place Erica to help Leroy across water.',
        20
      )
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
  
  function howToPlay:start()

    engine:addGameObject(self.tutorialScreens.screen1)
    engine:addGameObject(self.textBoxes.screen1TextBox)

    
    engine.input:setTouchPromise(function()

      engine:deleteGameObject(self.textBoxes.screen1TextBox)
      engine:addGameObject(self.tutorialScreens.screen2)
      engine:addGameObject(self.textBoxes.screen2TextBox1)
      engine:addGameObject(self.textBoxes.screen2TextBox2)
      engine:addGameObject(self.textBoxes.screen2TextBox3)
      engine:addGameObject(self.textBoxes.screen2TextBox4)
      engine:addGameObject(self.textBoxes.screen2TextBox5)

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
  deck = engine:loadQuad(path, width, height)

  tutorialScreen = createDrawableGameObject(
    0,
    config.prefferedHeight * -1,
    deck
  )
  
  return tutorialScreen
end