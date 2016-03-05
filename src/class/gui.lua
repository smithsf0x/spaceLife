-- @Author: smithsf0x
-- @Date:   2016-03-02 22:05:15
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-05 21:04:22

GUI = {}


function getPlayerSpeed()
	return PLAYER.accx
end

function GUI:load()

end


function GUI:update()

end


function GUI:draw(player)
	love.graphics.print("AccY : " .. math.abs(player.accy), 10, 10)
	love.graphics.print("AccX : " .. math.abs(player.accx), 10, 25)
end

return GUI