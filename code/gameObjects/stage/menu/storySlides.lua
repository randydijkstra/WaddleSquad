function createStorySlides()
  local animationLength = config.SSanimationDuration
  local animationSpeed = config.defaultAnimationSpeed
  local currentSlide
  
  local storySlides = {
    name = "storySlides",
    slides = {
      slide01 = createSlide(
        "assets/sprites/storySlides/Storytelling01.png",
        animationLength,
        1
      ),
      slide02 = createSlide(
        "assets/sprites/storySlides/Storytelling02.png",
        animationLength,
        2
      ),
      slide03 = createSlide(
        "assets/sprites/storySlides/Storytelling03.png",
        animationLength,
        3
      ),
      slide04 = createSlide(
        "assets/sprites/storySlides/Storytelling04.png",
        animationLength,
        4
      ),
      slide05 = createSlide(
        "assets/sprites/storySlides/Storytelling05.png",
        animationLength,
        5
      )
    }
  }
  
  function storySlides:start()
    
    --Touch to skip
    engine.input:setTouchPromise(function()
      
      removeAllPromises()
      engine:loadLevel("level1")
      
    end)  
    
    engine:playMusic('assets/sounds/music/Intro.ogg', 0.9)
    --Slide01
    print('add slide01')
    engine:addGameObject(self.slides.slide01)
    self.slideAnimation(self.slides.slide01)
    
    --Slide02
    local slide02Promise = createPromise(animationLength, function() 
      print('add slide02')
      --engine:deleteGameObject(self.slides.slide01)
      engine:addGameObject(self.slides.slide02)
      self.slideAnimation(self.slides.slide02)
      
      --Slide03
      local slide03Promise = createPromise(animationLength, function() 
        print('add slide03')
        engine:addGameObject(self.slides.slide03)     
        self.slideAnimation(self.slides.slide03)
     
        --Slide04
        local slide04promise = createPromise(animationLength, function() 
          print('add slide04')
          engine:addGameObject(self.slides.slide04)
          self.slideAnimation(self.slides.slide04)
          
          --Slide05
          local slide05Promise = createPromise(animationLength, function() 
            print('add slide05')
            engine:addGameObject(self.slides.slide05)     
            self.slideAnimation(self.slides.slide05)
            
            --Load level1
            local endPromise = createPromise(animationLength, function() 
              print('add slide05')
              engine:loadLevel("level1")      
            end)
          end)
        end)
      end)
    end)
  end
  
  function storySlides:slideAnimation(slideToAnimate)
    --[[
      create function that animates slide dependings on slide width and animationlength
    ]]--
    local prop = MOAIProp2D.new()
    prop = slideToAnimate
    local xAxis = ((config.prefferedWidth * config.slideScaleFactor) - config.prefferedWidth) * -1
    self.prop:moveLoc(xAxis, 0, config.SSanimationDuration, MOAIEaseType.LINEAR)
  end
  
  function storySlides:destroy()
    engine:destroyAllObject()
  end
  
  return storySlides
end

function createSlide(path, animationLength, orderInPlay)
  local deck = engine:loadQuad(
    path, 
    config.prefferedWidth * config.slideScaleFactor, 
    config.prefferedHeight
  )
  local slide = createDrawableGameObject(
    0, 
    config.prefferedHeight * -1, 
    deck
  )
  
  return slide
end