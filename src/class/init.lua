-- @Author: smithsf0x
-- @Date:   2016-03-02 21:42:50
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-02 22:05:31

print("Initializing class...\n")

local path = (...):gsub('%.init$', '') .. "/"

STARS 	= require(path .. "stars")
MAP 	= require(path .. "map")
PLAYER 	= require(path .. "player")
GUI 	= require(path .. "gui")