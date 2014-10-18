--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x00733160 ]
	table [ "firstLaunch" ] = false
	table [ "muteSound" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x00733180 ]
	table [ "lvl1" ] = 3775
	table [ "lvl3" ] = 625
	table [ "lvl4" ] = 1600

	table = objects [ 0x007331A0 ]

	table = objects [ 0x007331C0 ]
	table [ "application" ] = "Waddle Squad"
	table [ "config" ] = objects [ 0x00733160 ]
	table [ "highscores" ] = objects [ 0x00733180 ]
	table [ "highScores" ] = objects [ 0x007331A0 ]

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x00733160 ] = {},
	[ 0x00733180 ] = {},
	[ 0x007331A0 ] = {},
	[ 0x007331C0 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x007331C0 ]
