--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x41ED6CE0 ]
	table [ "lvl4" ] = 1600
	table [ "lvl1" ] = 3775
	table [ "lvl3" ] = 625

	table = objects [ 0x41ED7168 ]
	table [ "muteSound" ] = true
	table [ "firstLaunch" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x41ED74A0 ]

	table = objects [ 0x41ED74C8 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highScores" ] = objects [ 0x41ED74A0 ]
	table [ "highscores" ] = objects [ 0x41ED6CE0 ]
	table [ "config" ] = objects [ 0x41ED7168 ]

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x41ED6CE0 ] = {},
	[ 0x41ED7168 ] = {},
	[ 0x41ED74A0 ] = {},
	[ 0x41ED74C8 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x41ED74C8 ]
