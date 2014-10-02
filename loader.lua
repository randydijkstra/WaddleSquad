--[[--
  This file will load every file found (recursive) in the code map. 
  This way we don't have to write new include statement everytime we add a new file.
--]]--

function loadDirectory(directory)
  
  for key, dir in pairs(MOAIFileSystem.listDirectories(directory)) do
    loadDirectory(directory..'/'..dir)
  end
  
  for key, file in pairs(MOAIFileSystem.listFiles(directory)) do
    if string.sub(file,-4,-1) == '.lua' then
      dofile(directory..'/'..file)
    end
  end

end

loadDirectory('code')