--[[ Create / handle UI here ]]--
--[[ TODO Game UI:
  Non interactable:
  - Time counter
  - Score counter
  
  Interactable:
  - Buttons:
    - Spawn new penguin
    - Place blocks:
      - Icebear (other can be made later)
    - Pause game (to be made after update 1.2)
]]--
function getGameUI()
  local spritePath = 'assets/sprites/ui/'
  
  local UI = {
    name = "splashScreen",
    huds = {
      scoreCounter = createHud(x, y, path),
      timeCounter = createHud(x, y, path),
    },    
    buttons = {
      penguinSpawnButton = createPenguinSpawnButton(x, y, path, callback),
      placeJumpBoostButton = createJumpBoostButton(x, y, path, callback),
      menuButton = createMenuButton(x, y, path, callback)
    }
  }
  
  --textbox:setString(
  --add to engine.uiLayer
  
  function UI:start()
    for keys, object in pairs(self.buttons) do
      engine:addGameObject(object)
    end
    for keys, object in pairs(self.huds) do
      engine:addGameObject(object)
    end
  end
  
  function UI:update()
    self.huds.scoreCounter:updateInfo(score)
    self.huds.timerCounter:updateInfo(score)
  end
end

function createHud(x, y, path)
  -- create hud object
  
  
  function hud:updateInfo(value)
    hudText:setString(value)
  end
end

function createGameUIButton(x, y, path, callback)
  --create button object
  Button = createDrawableGameObject(x, y)
  onTouchCallback = callback
  table.insert(Button.factions, "touchables")
  
  
  function Button:onTouch(callback)
    callback()
  end
end

function boostCallback()
  
end

function menuCallback()
  
end

function jumpBoostCallback()
  
end