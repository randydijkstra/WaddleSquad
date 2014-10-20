--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x03DD0170 ]
	table [ "lvl1" ] = 3775
	table [ "lvl4" ] = 1600
	table [ "lvl2" ] = 1575
	table [ "lvl3" ] = 625

	table = objects [ 0x03DD05F8 ]
	table [ "muteSound" ] = false
	table [ "firstLaunch" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x03DD0930 ]

	table = objects [ 0x03DD0958 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highScores" ] = objects [ 0x03DD0930 ]
	table [ "highscores" ] = objects [ 0x03DD0170 ]
	table [ "config" ] = objects [ 0x03DD05F8 ]

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x03DD0170 ] = {},
	[ 0x03DD05F8 ] = {},
	[ 0x03DD0930 ] = {},
	[ 0x03DD0958 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x03DD0958 ]
