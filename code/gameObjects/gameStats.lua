function createGameStats(levelName, defaultScore, defaultTimer)
  
  --Default gamestats at start of level
  gameStats = {
    score = defaultScore,
    time = defaultTimer,
    penguinsOnScreen = 0,
    penguinsLeft = 10,
    penguinsFinished = 0
  }
  
  function gameStats:start()
    --addGameObject(self.gameStats)
    print("Entering gamestats of "..levelName..". Score: "..defaultScore..". Timer: "..defaultTimer)
  end
  
  function gameStats:destroy()
    engine:destroyAllObject()
  end
  
  function gameStats:newPenguin()
    self.penguinsOnScreen = self.penguinsOnScreen + 1
    self.penguinsLeft = self.penguinsLeft - 1
  end
  
  function gameStats:updateStats(condition)
    if condition == "snowflake" then
      self.score = self.score + 100
      local updatedScore = tostring(self.score)
      gameUI.hudTexts.scoreCounterText:updateInfo(updatedScore)
    elseif condition == "iglo" then
      self.score = self.score + 200
      local updatedScore = tostring(self.score)
      gameUI.hudTexts.scoreCounterText:updateInfo(updatedScore)
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
  
  return gameStats
end