function createGameStats(levelName, defaultScore, defaultTimer)
  
  --Default gamestats at start of level
  local gameStats = createGameObject()
  mergeTables(gameStats,
    {
      score = defaultScore,
      time = defaultTimer,
      penguinsOnScreen = 0,
      penguinsLeft = 10,
      penguinsFinished = 0,
      timer, -- holds the countdown timer
    }
  )
  
  function gameStats:start()
    print("Entering gamestats of "..levelName..". Score: "..defaultScore..". Timer: "..defaultTimer)
    self:gameTimer(self.time)
  end
  
  function gameStats:update()
    --will check condidtions for gameover, level complete and suchs things.
    
    --If no penguins crossed the finishline when timer = 0, call gameOver()
    
    --When timer = 0 and at least 1 penguin is finished, level complete.
  end
  
  function gameStats:gameOver()
    
  end
  
  function gameStats:levelComplete()
    
  end
  
  function gameStats:newPenguin()
    self.penguinsOnScreen = self.penguinsOnScreen + 1
    self.penguinsLeft = self.penguinsLeft - 1
  end
  
  function gameStats:updateStats(condition)
    if condition == "snowflake" then
      self.score = self.score + 100
    elseif condition == "iglo" then
      self.score = self.score + 200
      self.penguinsFinished = self.penguinsFinished + 1
      self.penguinsOnScreen = self.penguinsOnScreen - 1
      self.penguinsLeft = self.penguinsLeft - 1
    end
    
     engine.gameUI:updateScore(self.score)
     
    --[[print(
      "score: ".. self.score ..
      "\n time: ".. self.time ..
      "\n penguinsOnScreen: ".. self.penguinsOnScreen ..
      "\n penguinsLeft: ".. self.penguinsLeft ..
      "\n penguinsFinished: ".. self.penguinsFinished
    )]]--
  end
  
  function gameStats:onDestroy()
    self.timer:stop()
    self.timer = nil
  end
  
  function gameStats:gameTimer()
    print("Start the Timer!")
    
    local timer = createLoopingTimer(1, function()
      self.time = self.time - 1      
      engine.gameUI:updateTime(self.time)
        
      if self.time <= 0 then
        self.timer:stop()
        print("Time is up!")    
      end
        
    end)

    self.timer = timer:start()
  end
  
  return gameStats
end