--[[--
  Random function's without a better place
--]]--
function math.Clamp(val, lower, upper)
    assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way  
    return math.max(lower, math.min(upper, val))
end

function newFontStyle( font, size )
  
  local fontStyle = MOAITextStyle.new()
  fontStyle:setFont( font )
  fontStyle:setSize( size )
  fontStyle:setColor( 0,0,0,1 )
  return fontStyle
  
end

promises = {} -- hold all promises so they can be deleted before firing
function createPromise( spanTime, callbackFunction, params)
	local timer = MOAITimer.new ()
	timer:setSpan ( spanTime )
	timer:setMode ( MOAITimer.NORMAL )
	timer:setListener ( MOAITimer.EVENT_TIMER_END_SPAN, function()
    callbackFunction(params)
    timer = nil
  end)
	timer:start ()

  table.insert(promises, timer)

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

function fitToScale(width, height, scaleWidth, scaleHeight)
  
  local finalWidth, finalHeight
  
  if math.ceil(width / scaleWidth) > math.ceil(height / scaleHeight) then
    finalWidth = math.ceil(width / scaleWidth) * scaleWidth
    finalHeight = (finalWidth / scaleWidth) * scaleHeight   
  else
    finalHeight = math.ceil(height / scaleHeight) * scaleHeight
    finalWidth = (finalHeight / scaleHeight) * scaleWidth  
  end
  
  local leftOverWidth = finalWidth - width
  local leftOverHeight = finalHeight - height
  
  return finalWidth, finalHeight, leftOverWidth, leftOverHeight
end

function isStringInTable(table, string)
  
  for key, value in pairs(table) do
    if value == string then
      return true
    end
  end
  
  return false
end

function pointInsideRect(rectX, rectY, rectWidth, rectHeight, x, y)
  if x > rectX and x < rectX + rectWidth and y > rectY and y < rectY + rectHeight then
    return true
  end  
  return false
end

function iif(cond, A, B)
  if cond then
    return A
  else
    return B
  end
end

function mergeTables(t1, t2)
  -- There is a change infinte loops will occur with this function
  for k, v in pairs(t2) do
      if (type(v) == "table") and (type(t1[k] or false) == "table") then
          merge(t1[k], t2[k])
      else
          t1[k] = v
      end
  end
  return t1
end

function extendFunction(old, new)
  return function() 
    old()
    new()
  end
end

function createSmoothEdgePolygon(minX, minY, maxX, maxY, smoothX, smoothY)
  return {
    --top left
    minX, minY + smoothY, 
    minX + smoothX, minY,  
    
    -- top right
    maxX - smoothX, minY,
    maxX, minY + smoothY,
    
    -- bottom right
    maxX, maxY - smoothY,
    maxX - smoothX, maxY,
    
    -- bottom left
    minX + smoothX, maxY,
    minX, maxY - smoothY
  }
end

function countTable(table)
  local count = 0
  for key, value in pairs(table) do
    count = count + 1 
  end
  return count
end