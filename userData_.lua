--MOAI
serializer = ... or MOAIDeserializer.new ()

local function init ( objects )

	--Initializing Tables
	local table

	table = objects [ 0x0065ABB0 ]
	table [ "highscores" ] = objects [ 0x0065ABF0 ]
	table [ "application" ] = "Waddle Squad"
	table [ "highScores" ] = objects [ 0x0065ABD0 ]

	table = objects [ 0x0065ABD0 ]

	table = objects [ 0x0065ABF0 ]
	table [ "lvl2" ] = 1475
	table [ "lvl1" ] = 1575

end

--Declaring Objects
local objects = {

	--Declaring Tables
	[ 0x0065ABB0 ] = {},
	[ 0x0065ABD0 ] = {},
	[ 0x0065ABF0 ] = {},

}

init ( objects )

--Returning Tables
return objects [ 0x0065ABB0 ]
