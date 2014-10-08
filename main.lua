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

-- test if extends works in self
function obj1()
  local obj = {
   val1 = 1,
   val2 = 2,
   val3 = "string"
  }
  
  function obj:name()
    print("val3: "..self.val3)
  end
  
  function obj:int()
    print(self.val1)
  end
  
  function obj:test()
    self.val1 = self.val1+1
  end
  
  return obj
end

function obj11()
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

o1["name"]()
o1:int()
o1:test()
o1:int()
