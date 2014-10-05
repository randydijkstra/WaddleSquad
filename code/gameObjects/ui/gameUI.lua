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

function getGameUI()
  local spritePath = 'assets/sprites/ui/'
  
  local UI = {
    name = "splashScreen",
    huds = {
      scoreCounter = createHud(),
      timeCounter = createHud(),
    },    
    buttons = {
      penguinSpawnButton = createButton(),
      placeJumpBoostButton = createButton(),
      backToMenu = createButton()
    }
  }
  
  --textbox:setString(
  --add to engine.uiLayer
  
  function UI:start()
    --Do something here
  end
end

function createHud(x, y)
  
end

funtion createButton(x, y, path)
  Button = createDrawableGameObject(x, y)
  table.insert(Button.factions, "touchables")
  
  function Button:onTouch()
    
  end
end]]--