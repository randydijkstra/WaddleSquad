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
    - Pause game (to be made after update 1.1)
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
      penguinSpawnButton = createGameUIButton(x, y, path),
      placeJumpBoostButton = createGameUIButton(x, y, path),
      backToMenu = createGameUIButton(x, y, path)
    }
  }
  
  --textbox:setString(
  --add to engine.uiLayer
  
  function UI:start()
    --Do something here
  end
end

function createHud(x, y, path)
  
end

function createGameUIButton(x, y, path)
  Button = createDrawableGameObject(x, y)
  table.insert(Button.factions, "touchables")
  
  function Button:onTouch()
    
  end
end