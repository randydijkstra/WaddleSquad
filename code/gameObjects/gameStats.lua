function createGameStats(levelName, defaultScore, defaultTimer)
  
  --Default gamestats at start of level
  local gameStats = createGameObject()
  mergeTables(gameStats,
    {
      score = defaultScore,
      time = defaultTimer,
      penguinsOnScreen = 0,
      penguinsLeft = 10,
      penguinsFinished = 0
    }
  )
  
  function gameStats:start()
    --addGameObject(self.gameStats)
    print("Entering gamestats of "..levelName..". Score: "..defaultScore..". Timer: "..defaultTimer)
    self:gameTimer(self.time)
  end
  
  function gameStats:newPenguin()
    self.penguinsOnScreen = self.penguinsOnScreen + 1
    self.penguinsLeft = self.penguinsLeft - 1
  end
  
  function gameStats:updateStats(condition)
    if condition == "snowflake" then
      self.score = self.score + 100
      local updatedScore = tostring(self.score)
      engine.gameUI.hudTexts.scoreCounterText:updateInfo("Score: \n"..updatedScore)
    elseif condition == "iglo" then
      self.score = self.score + 200
      local updatedScore = tostring(self.score)
      engine.gameUI.hudTexts.scoreCounterText:updateInfo("Score: \n"..updatedScore)
      self.penguinsFinished = self.penguinsFinished + 1
      self.penguinsOnScreen = self.penguinsOnScreen - 1
      self.penguinsLeft = self.penguinsLeft - 1
    end
    
    print(
      "score: ".. self.score ..
      "\n time: ".. self.time ..
      "\n penguinsOnScreen: ".. self.penguinsOnScreen ..
      "\n penguinsLeft: ".. self.penguinsLeft ..
      "\n penguinsFinished: ".. self.penguinsFinished
    )
  end
  
  function gameStats:gameTimer(startTime)
    print("Start the Timer!")
    local countdown = startTime

    local timer = MOAITimer.new()
    timer:setMode( MOAITimer.LOOP )
    timer:setSpan( 1 )
    timer:setListener( 
      MOAITimer.EVENT_TIMER_LOOP, 
      function()
        countdown = countdown - 1      
        self.time = countdown
        local updatedTime = tostring(self.time)
        --print("Time left: ".. updatedTime)
        engine.gameUI.hudTexts.timeCounterText:updateInfo(updatedTime)
        
        if countdown == 0 then
          timer:stop()
        end
      end
    )
    timer:start()
  end
  
  return gameStats
end