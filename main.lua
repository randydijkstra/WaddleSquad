--[[--
  main.lua
  Loads all important files on startup
--]]--

require 'loader'
require 'setup'

--Launch SplashScreen

if config.showSplashScreen then
  getSplashScreen():start() 
else
  createLevelSelector():start()
end

--[[
  -- storage tests

  --engine.userData:set("testVarData", "testVarName")
  --engine.userData:set("testGroup1Data", "testgroup1VarName", "testGroupName")
  --engine.userData:set("testGroup2Data", "testgroup2VarName", "testGroupName")

  print(engine.userData:get("testVarName"))
  print(engine.userData:get("testgroup1VarName", "testGroupName"))
  print(engine.userData:get("testgroup2VarName", "testGroupName"))
  print(engine.userData:get("testGroupName"))
--]]

--[[
-- proof extend chains works without self bulshit
function test1()
  print('imanewb')
end

test1 = extendFunction(test1, function()
  print("ima newb too")
end)

test1 = extendFunction(test1, function()
  print("omg newbs unite ")
end)

test1()

-- object extend testing. Passign paramters doens't work yet
function obj1()
  local obj = {
   val1 = 1,
   val2 = 2,
   val3 = "string"
  }
  
  function obj:name(test, test2, test3, test4)
    print("val3: "..self.val3)
    print(test)
  end
  
  function obj:int()
    print(self.val1)
  end
  
  function obj:test()
    self.val1 = self.val1+1
  end
  
  function obj:extend(old, new)
    return function(at1, at2, at3, at4, at5, at6, at7)
      old(self, at1, at2, at3, at4, at5, at6, at7)
      new(self, at1, at2, at3, at4, at5, at6, at7)
    end
  end
  
  return obj
end

function obj11()
  
  local self = obj
  
  local obj = obj1()
  obj.val3 = "Obj11"
  
  return obj
end

function obj12()
  local obj = obj11()
  obj.val3 = "Obj12"
  
  return obj
end

o1 = obj12()

o1:name("lol")

o1.name = o1:extend(o1.name, function(self, test)
  print("test: "..self.val1)
  print(test)
end)

o1:name("lol")

o1.name = o1:extend(o1.name, function(self)
  print("test2: "..self.val3)
end)

o1:name("lol")

--]]