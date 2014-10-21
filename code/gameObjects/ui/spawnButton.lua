function createSpawnButton(x, y, width, height, imagePath, cost, spawnWidth, spawnHeight, touchSound, spawnSound, callback, spawnMarigin, spawnCondition)
  --create button object
  local spawnButton = createButton(x, y, width, height, imagePath, callback)
  table.insert(spawnButton.factions, "buttons")
  spawnButton.cost = cost
  spawnButton.touchSound = touchSound
  spawnButton.spawnSound = spawnSound
  spawnButton.spawnWidth = spawnWidth
  spawnButton.spawnHeight = spawnHeight
  spawnButton.spawnMarigin = iif(spawnMarigin == nil, 0, spawnMarigin)
  spawnButton.spawnCondition = spawnCondition
  
  spawnButton.onTouch = function(self, x, y)
    
    if engine.gameStats.score >= self.cost then
      self.prop:seekColor(0.6, 0.6, 0.6, 1, 0.2)
      engine:playSound(self.touchSound)
      
      engine.input:setTouchPromise(function(x, y)
        x, y = engine.mainLayer:wndToWorld(x, y)
        
        local buttonX, buttonY = engine:uiToMain(self.x, self.y)
        if pointInsideRect(buttonX, buttonY, self.width, self.height, x, y) then
          self.prop:seekColor(1, 1, 1, 1, 0.2)  
          return false
        elseif     
          spawnCondition and spawnCondition() == true or  
          engine.currentLevel:rectInBoxes( 
            x - self.spawnWidth / 2, y + self.spawnHeight / 2, 
            self.spawnWidth, self.spawnHeight, self.spawnMarigin ) == false 
        then
          
          if self.callback(x, y) ~= false then -- allow the callback to disable spawning
            engine.gameStats:updateScore(-self.cost)
            self.prop:seekColor(1, 1, 1, 1, 0.2)    
            engine:playSound(self.spawnSound)
          end
          
        else
          return true -- return true so touchcalback is called again
        end
      end)
      
    else
      -- feedback to user
      local text = engine:addGameObject(createTextBox(
          config.prefferedWidth/2, - (config.prefferedHeight / 2),
          200, 200,
          "Not eneugh Moneys",
          32,
          true
      ))
      createPromise(1.5, function() engine:deleteGameObject(text) end)
    end

  end
  
  return spawnButton
end