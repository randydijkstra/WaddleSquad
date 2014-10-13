function createScore(x, y, points, width, height, size)
 
  local score = createTextBox(x, y, width, height, "+"..tostring(points), size, true)
  table.insert(score.factions, "score")
    
  score.prop:moveScl(0.4, 0.4, 1, 0.8, MOAIEaseType.EASE_IN)
  score.prop:seekLoc(
    x, 
    y + 20,
    1,
    1.5,
    MOAIEaseType.EASE_IN
  )
  
  createPromise(1.5, function()        
    engine:deleteGameObject(score)
  end)
    
  return score
end
