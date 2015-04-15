--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x07F74FF8 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highscores" ] = objects [ 0x07F75020 ]
	table [ "highScores" ] = objects [ 0x07F75070 ]
	table [ "config" ] = objects [ 0x07F75048 ]

	table = objects [ 0x07F75020 ]
	table [ "lvl5" ] = 800
	table [ "lvl3" ] = 1200
	table [ "lvl4" ] = 1600
	table [ "lvl2" ] = 1250
	table [ "lvl1" ] = 1500

	table = objects [ 0x07F75048 ]
	table [ "muteSound" ] = false
	table [ "firstLaunch" ] = false
	table [ "firstBoot" ] = true

	table = objects [ 0x07F75070 ]

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x07F74FF8 ] = {},
	[ 0x07F75020 ] = {},
	[ 0x07F75048 ] = {},
	[ 0x07F75070 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x07F74FF8 ]
