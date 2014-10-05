function createGameHandler()
  --Start stats on new level
  local gameHandler = {
    score = 0,
    time = 0,
    penguinsOnScreen = 0,
    penguinsLeft = 10,
    penguinsFinished = 0
  }
  
  function gameHandler:start()
    --do something
  end
  
  function gameHandler:setScore(score)
    self.score = score
  end
  
  function gameHandler:getScore()
    return self.score
  end
end