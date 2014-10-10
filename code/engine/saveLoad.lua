--[[
  This file will load and save all persistent data in engine.userData
-]]

function createUserData()
  local userData = {
    path = (MOAIEnvironment.documentDirectory or "./") .. "/userData_.lua",
    data = {
      application = config.gameTitle,
      highScores = {} -- key: "level1" value: 100
    }
  }
   
  function userData:set(data, varName, group)
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
  
  function userData:get(varName, group)
    if group then
      return self.data[group][varName]
    else
      return self.data[varName]
    end
  end
  
  function userData:save()
    local serializer = MOAISerializer.new()
    serializer:serialize ( self.data )
    local userDataString = serializer:exportToString()
    
    local user_data_file = io.open (self.path, 'wb' )
    if (user_data_file ~= nil) then
      user_data_file:write ( userDataString )
      user_data_file:close ()
    end
    
  end
  
  function userData:load()
    local file = loadfile(self.path) or nil
    if file then
      self.userData = file()
    end
  end
  
  function userData:reset()
    self = createUserData()
    self:save()
  end
  
  return userData
end
 
