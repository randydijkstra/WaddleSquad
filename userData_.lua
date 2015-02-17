--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x06029358 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highscores" ] = objects [ 0x0606F060 ]
	table [ "highScores" ] = objects [ 0x060CA1C8 ]
	table [ "config" ] = objects [ 0x060BA600 ]

	table = objects [ 0x0606F060 ]
	table [ "lvl2" ] = 1250
	table [ "lvl3" ] = 1200
	table [ "lvl4" ] = 1600
	table [ "lvl5" ] = 800
	table [ "lvl1" ] = 1500

	table = objects [ 0x060BA600 ]
	table [ "muteSound" ] = false
	table [ "firstLaunch" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x060CA1C8 ]

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x06029358 ] = {},
	[ 0x0606F060 ] = {},
	[ 0x060BA600 ] = {},
	[ 0x060CA1C8 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x06029358 ]
