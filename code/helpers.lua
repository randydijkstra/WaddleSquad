--[[--
  Random function's without a better place
--]]--
function math.Clamp(val, lower, upper)
    assert(val and lower and upper, "not very useful error message here")
   -- if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end

function newFontStyle( font, size )
  
  local fontStyle = MOAITextStyle.new()
  fontStyle:setFont( font )
  fontStyle:setSize( size )
  fontStyle:setColor( 0,0,0,1 )
  return fontStyle
  
end

function createPromise( spanTime, callbackFunction )
	local timer = MOAITimer.new ()
	timer:setSpan ( spanTime )
	timer:setMode ( MOAITimer.NORMAL )
	timer:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, callbackFunction )
	timer:start ()

	return timer
end

function createLoopingTimer ( spanTime, callbackFunction, fireRightAway )
	local timer = MOAITimer.new ()
	timer:setSpan ( spanTime )
	timer:setMode ( MOAITimer.LOOP )
	timer:setListener ( MOAITimer.EVENT_TIMER_LOOP, callbackFunction )
	timer:start ()
	if ( fireRightAway ) then
		callbackFunction () 
	end
	return timer
end

function levelLoader(levelName)
  if levelName == "level1" then
      lvl1 = getLvl1()
      currentLevel = lvl1
      lvl1:start()
  elseif levelName == "level2" then
      print("herpderp")
  end
end

function resizeToScale(width, height, scaleWidth, scaleHeight)
  
  finalWidth = math.floor(width / scaleWidth) * scaleWidth
  finalHeight = math.floor(height / scaleHeight) * scaleHeight
  
  return finalWidth, finalHeight
end