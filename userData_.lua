--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x019770A0 ]
	table [ "application" ] = "Waddle Squad"
	table [ "config" ] = objects [ 0x019770E0 ]
	table [ "highscores" ] = objects [ 0x019BDC40 ]
	table [ "highScores" ] = objects [ 0x019770C0 ]

	table = objects [ 0x019770C0 ]

	table = objects [ 0x019770E0 ]
	table [ "firstLaunch" ] = false

	table = objects [ 0x019BDC40 ]
	table [ "lvl1" ] = 875

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x019770A0 ] = {},
	[ 0x019770C0 ] = {},
	[ 0x019770E0 ] = {},
	[ 0x019BDC40 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x019770A0 ]
