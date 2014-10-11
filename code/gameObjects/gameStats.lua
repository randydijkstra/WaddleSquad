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
    self.penguinsLeft = 10
    self.penguinsFinished = 0
    self.toggleJumpBoostSpawner = false
  end
  
  function gameStats:update()
    
    self.penguinsOnScreen = countTable(engine:getFaction('penguins'))
    
    if self.time > 0 and self.score < 0 then
      self.score = 0
    end
 
    if self.time == 0 and self.penguinsFinished <= 0 then
      self:gameOver()
    elseif self.time == 0 and self.penguinsFinished > 0 then
      self:levelComplete()
    --elseif self.penguinsOnScreen <= 0 and self.score < 300 then
    --  self:gameOver()
    elseif self.penguinsOnScreen <= 0 and self.penguinsLeft <= 0 and self.score > 0 then
      self:levelComplete()    
    elseif self.penguinsOnScreen <= 0 and self.penguinsLeft <= 0 and self.score < 0 then
      self:gameOver()
    end

  end
  
  function gameStats:gameOver()
    engine:removeFromFaction(self, 'update')
    engine.gameUI:completeScreen(false, self.score)
  end
  
  function gameStats:levelComplete()
    engine:removeFromFaction(self, 'update')
    engine.gameUI:completeScreen(true, self.score)
  end
  
  function gameStats:newPenguin()
    if self.firstPenguin == false then 
      self.score = self.score - 100
      self.penguinsLeft = self.penguinsLeft - 1
      engine.gameUI:updateAmountOfPenguinsLeft(
        "Penguins left: " .. tostring(self.penguinsLeft)..
        "\nPenguins arrived: " .. tostring(self.penguinsFinished)
      )
      engine.gameUI:updateScore(tostring(self.score))
    end
    self.firstPenguin = false
  end
  
  function gameStats:updateStats(condition)
    if condition == "small" then
      self.score = self.score + 25
    elseif condition == "big" then
      self.score = self.score + 50
    elseif condition == "iglo" then
      self.score = self.score + 200
      self.penguinsFinished = self.penguinsFinished + 1
      engine.gameUI:updateAmountOfPenguinsLeft(
        "Penguins left: " .. tostring(self.penguinsLeft)..
        "\nPenguins arrived: " .. tostring(self.penguinsFinished)
      )
    end
    
    engine.gameUI:updateScore(tostring(self.score))
     
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
      engine.gameUI:updateTime(tostring(self.time))
      
      --print("font table length: "..countTable(engine.storage.fonts))
      --print("fontstyle table length: "..countTable(engine.storage.fontStyles))

      if self.time <= 0 then
        self.timer:stop()
        print("Time is up!")
      end
        
    end)

    self.timer = timer:start()
  end
  
  return gameStats
end