-- @Author: smithsf0x
-- @Date:   2016-03-02 21:43:57
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-05 21:19:43

local STARS = {}



function STARS:load()
	self.sprite = love.graphics.newImage("assets/space/big.png")
end

local function drawDeepStars()
	end

local function drawMidStars()

end

local function drawNearStars()

end

function STARS:draw(x, y, speed)


	drawDeepStars()
	drawMidStars()
	drawNearStars()
	love.graphics.draw(self.sprite, 0, 0)

end

return STARS