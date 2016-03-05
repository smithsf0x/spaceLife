-- @Author: smithsf0x
-- @Date:   2016-03-02 19:29:19
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-05 21:17:49


require("lib")
require("class")

local dx,dy


function love.load()
	STARS:load()
	PLAYER:load()
	camera = CAMERA(PLAYER.x, PLAYER.y)
end


function love.update(dt)
	PLAYER:update(dt)
	dx, dy = PLAYER.x - camera.x, PLAYER.y - camera.y
    camera:move(dx/2, dy/2)
end


function love.keypressed(key)
   if(key == "esc") then love.exit() end
end


function love.draw()
	camera:attach()
	STARS:draw(1, 2, 0)
	MAP:draw(0, 0, 0)
	PLAYER:draw()

	camera:detach()

	GUI:draw(PLAYER)
end


function love.exit()

end