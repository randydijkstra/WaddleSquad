--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x01F2D828 ]
	table [ "muteSound" ] = false
	table [ "firstLaunch" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x01F2DFB8 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highscores" ] = objects [ 0x01F2E318 ]
	table [ "highScores" ] = objects [ 0x01F2DFE0 ]
	table [ "config" ] = objects [ 0x01F2D828 ]

	table = objects [ 0x01F2DFE0 ]

	table = objects [ 0x01F2E318 ]
	table [ "lvl5" ] = 800
	table [ "lvl3" ] = 1200
	table [ "lvl4" ] = 1600
	table [ "lvl2" ] = 1250
	table [ "lvl1" ] = 1500

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x01F2D828 ] = {},
	[ 0x01F2DFB8 ] = {},
	[ 0x01F2DFE0 ] = {},
	[ 0x01F2E318 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x01F2DFB8 ]
