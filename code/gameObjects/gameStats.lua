function createGameStats(levelName, defaultScore, defaultTimer)
  
  --Default gamestats at start of level
  gameStats = {
    score = 0,
    time = defaultTimer
  }
  
  function gameStats:start()
    --addGameObject(self.gameStats)
    print("Entering gamestats of "..levelName..". Score: "..defaultScore..". Timer: "..defaultTimer)
  end
  
  function gameStats:destroy()
    engine:destroyAllObject()
  end
  
  return gameStats
end