function createMoveableGameObject(x, y, deck, MOAIBox2DBodyType)
  local gameObject = createCollidingGameObject(x, y, deck, MOAIBox2DBodyType)

  table.insert(gameObject.factions, 'moveables') 
  table.insert(gameObject.factions, 'update') 
  
  function gameObject:update()    
    self:capSpeed()
    
    if self.correctionPromise then
      self.body:setTransform(self.correctionPromise.x, self.correctionPromise.y)
      self.correctionPromise = nil
    end
    
    self.prop:setLoc(self.body:getPosition())
    self.x, self.y = self.body:getPosition()
    
  end
  
  function gameObject:setCorrectionPromise(correction)
    self.correctionPromise = correction
  end
  
  function gameObject:capSpeed()
    if self.maxSpd then      
      local spdX, spdY = self.body:getLinearVelocity()
      
      local negX = math.abs(spdX) ~= spdX
      local negY = math.abs(spdY) ~= spdY
      
      spdX = math.abs(spdX)
      spdY = math.abs(spdY)
      
      local currentSpd = math.sqrt(spdX ^ 2 + spdY ^ 2 )
      if currentSpd > self.maxSpd then
        
        local slope = math.atan2(spdY, spdX)        
        
        spdY = math.sin(slope) * self.maxSpd
        spdX = math.cos(slope) * self.maxSpd
        
        if negX then spdX = spdX * -1 end
        if negY then spdY = spdY * -1 end
        
        self.body:setLinearVelocity(spdX, spdY)
      end
    end    
  end
  
  
  return gameObject
end