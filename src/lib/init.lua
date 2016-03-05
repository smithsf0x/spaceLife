-- @Author: smithsf0x
-- @Date:   2016-03-02 21:42:16
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-05 21:49:18

print("Initializing lib ...\n")

local path = (...):gsub('%.init$', '') .. "/"

require(path .. "lovedebug")
CAMERA 	= require(path .. "camera")