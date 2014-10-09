function createGameStats(levelName, defaultScore, defaultTimer)
  
  --Default gamestats at start of level
  local gameStats = createGameObject()
  mergeTables(gameStats,
    {
      score = defaultScore,
      time = defaultTimer,
      firstPenguin = true, --stays false somehow after 2nd level loaded
      penguinCanBeSpawned = true,
      penguinsOnScreen = 0,
      penguinsLeft = 10,
      penguinsFinished = 0,
      toggleJumpBoostSpawner = false,
      timer, -- holds the countdown timer
    }
  )
  
  table.insert(gameStats.factions, 'update')
  
  function gameStats:start()
    print("Entering gamestats of "..levelName..". Score: "..defaultScore..". Timer: "..defaultTimer)
    self:gameTimer(self.time)
    self.score = defaultScore
    self.time = defaultTimer
    self.firstPenguin = true
    self.penguinCanBeSpawned = true
    self.penguinsOnScreen = 0
    self.penguinsLeft = 10
    self.penguinsFinished = 0
    self.toggleJumpBoostSpawner = false
  end
  
  function gameStats:update()
    if self.time > 0 and self.score < 0 then
      self.score = 0
    end
 
    if self.time == 0 and self.penguinsFinished == 0 then
      self:gameOver()
    elseif self.penguinsOnScreen <= 0 and self.score < 300 then
      self:gameOver()
    elseif self.time == 0 and self.penguinsFinished > 0 then
      self:levelComplete()
     elseif self.penguinsFinished == 10 then
      self:levelComplete()
    end
  end
  
  function gameStats:gameOver()
    --print("Game over!")
    engine.gameUI:spawnGameOverScreen()
  end
  
  function gameStats:levelComplete()
    --print("Level complete")
    engine.gameUI:spawnLevelCompleteScreen()
  end
  
  function gameStats:newPenguin()
    if firstPenguin == false then 
      self.score = self.score - 300
      self.penguinsLeft = self.penguinsLeft - 1
      engine.gameUI:updateAmountOfPenguinsLeft(self.penguinsLeft)
      engine.gameUI:updateScore(self.score)
    end
    self.penguinsOnScreen = self.penguinsOnScreen + 1
    firstPenguin = false
  end
  
  function gameStats:updateStats(condition)
    if condition == "snowflake" then
      self.score = self.score + 100
    elseif condition == "iglo" then
      self.score = self.score + 400
      self.penguinsFinished = self.penguinsFinished + 1
      self.penguinsOnScreen = self.penguinsOnScreen - 1
    end
    
    engine.gameUI:updateScore(self.score)
     
    print(
      "score: ".. self.score ..
      "\n time: ".. self.time ..
      "\n penguinsOnScreen: ".. self.penguinsOnScreen ..
      "\n penguinsLeft: ".. self.penguinsLeft ..
      "\n penguinsFinished: ".. self.penguinsFinished
    )
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