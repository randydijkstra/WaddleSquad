--[[
  This file will load and save all persistent data in engine.userData
  --http://getmoai.com/forums/tutorial-data-persistence-how-to-do-it-t806/
-]]

function createStorage()
  local storage = {
    path = (MOAIEnvironment.documentDirectory or "./") .. "/userData_.lua",
    data = {
      application = config.gameTitle,
      highScores = {} -- key: "level1" value: 100
    }
  }
   
  function storage:set(data, varName, group)
    if group then 
      if self.data[group] then 
        self.data[group][varName] = data
      else
        self.data[group] = {}
        self.data[group][varName] = data
      end
    else
      self.data[varName] = data
    end
    
    self:save()
  end
  
  function storage:get(varName, group)
    if group then
      return self.data[group][varName]
    else
      return self.data[varName]
    end
  end
  
  function storage:save()
    local serializer = MOAISerializer.new()
    serializer:serialize ( self.data )
    local userDataString = serializer:exportToString()
    
    local user_data_file = io.open (self.path, 'wb' )
    if (user_data_file ~= nil) then
      user_data_file:write ( userDataString )
      user_data_file:close ()
    end
    
  end
  
  function storage:load()
    local file = loadfile(self.path) or nil
    if file then
      self.data = file()
    end
  end
  
  function storage:reset()
    self = createStorage()
    self:save()
  end
  
  return storage
end
 
