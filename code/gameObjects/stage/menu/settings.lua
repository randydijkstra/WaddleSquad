function createSettings()
  
  local settings = {
    name = "settings",
    headerText = createTextBox(config.prefferedWidth / 2, -100, 700, 64, "Settings", 50, false),
    buttons = {
      muteSoundButton = createButton(
        config.prefferedWidth / 2 - 100 , 
        (config.prefferedHeight / 2) * -1, 
        200, 100, 
        'assets/sprites/ui/Achtergrond3.png',
        muteCallback, 
        iif(
          engine.storage:get("muteSound", "config") == false, 
          "Mute", "Unmute"
        ), 
        true, 40
      ),
      backButton = createButton(
        config.prefferedWidth / 2 - 160, 
        (config.prefferedHeight / 1.1) * -1, 
        320, 100, 
        'assets/sprites/ui/Achtergrond3.png',
        backCallback, 
        "Back to menu", true, 45
      )
    }
  }
  
  function settings:start()
    engine:addGameObject(self.headerText)
    
    for key, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
  end
  
  function settings:destroy()
    engine:destroyAllObject()
  end
  
  return settings
end

function muteCallback()
  if engine.storage:get("muteSound", "config") == false then
    engine.storage:set(true, "muteSound", "config") -- If first boot, set boolean
    print("Sound muted")
    engine.currentLevel.buttons.muteSoundButton.textBox:updateInfo("Unmute")
  else
    print("Sound unmuted")
    engine.storage:set(false, "muteSound", "config") -- If first boot, set boolean
    engine.currentLevel.buttons.muteSoundButton.textBox:updateInfo("Mute")
  end
end

function backCallback()
  engine:loadLevel("levelSelector")
end