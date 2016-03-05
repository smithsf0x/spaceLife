-- @Author: smithsf0x
-- @Date:   2016-03-02 22:02:29
-- @Last Modified by:   smithsf0x
-- @Last Modified time: 2016-03-05 22:23:23

local SPEED_ROT = 0.2
local SPEED_STRAFE = 0.3
local SPEED_FORWARD = 1
local SPEED_BACKWARD = 0.3
local ACCEL_ROT= 0.2
local ACCEL_STRAFE = 0.03
local ACCEL_FORWARD = 1
local ACCEL_BACKWARD = 0.3
local ACCEL_INCREASE = 0.2
local SPEED_MAX = 7

local PLAYER = {
    camera = nil
}

function PLAYER:load()
    self.sprite = love.graphics.newImage("ship_p.png")
    self.rot = 0
    self.x = 500
    self.y = 500
    self.accx = 0
    self.accy = 0
    self.accr = 0

    self.camera = CAMERA(self.x, self.y)
end

function rad2deg(rad)
    -- return ( ( read * 180)/ 3.1415169)
    return( rad * 57.297161126)
end

function deg2rad(degree)
    -- return ( (degree * 3.1415169 )/ 180)
    return ( degree * 0.01745287167 )
end

function getNew(degree, x, y, speed)
    x = x - (speed * math.sin(deg2rad(degree)));
    y = y + (speed * math.cos(deg2rad(degree)));
    return x, y
end

function PLAYER:setXY(x, y)
    PLAYER.x = x
    PLAYER.y = y
end


function PLAYER:update( dt )
    if love.keyboard.isDown('q') then
        self.accr = self.accr + ACCEL_ROT * dt
    end
    if love.keyboard.isDown('e') then
        self.accr = self.accr - ACCEL_ROT * dt
    end

    if(self.accr ~= 0)then
        if(self.accr < 0)then
            self.rot = self.rot - self.accr
            self.rot = self.rot + SPEED_ROT * 57.297161126 * dt
            self.accr = self.accr + ACCEL_INCREASE * dt
            if (self.accr > 0 ) then self.accr = 0 end
        end
        if(self.accr > 0)then
            self.rot = self.rot - self.accr
            self.rot = self.rot - SPEED_ROT * 57.297161126 * dt
            self.accr = self.accr - ACCEL_INCREASE * dt
            if (self.accr < 0 ) then self.accr = 0 end
        end
    end

    if (self.rot >  360) then self.rot = self.rot - 360 end
    if (self.rot < -360) then self.rot = self.rot + 360 end

    if love.keyboard.isDown('s') then
        self.accx, self.accy = getNew(self.rot, self.accx, self.accy, dt * SPEED_BACKWARD)
    end
    if love.keyboard.isDown('d') then
        self.accx, self.accy = getNew(self.rot - 90, self.accx, self.accy, dt * SPEED_STRAFE)
    end
    if love.keyboard.isDown('a') then
        self.accx, self.accy = getNew(self.rot + 90, self.accx, self.accy, dt * SPEED_STRAFE)
    end
    if love.keyboard.isDown('w') then
        self.accx, self.accy = getNew(self.rot + 180, self.accx, self.accy, dt * SPEED_FORWARD)
    end
    if(self.accx > SPEED_MAX) then self.accx = SPEED_MAX end
    if(self.accx < -SPEED_MAX) then self.accx = -SPEED_MAX end
    if(self.accy > SPEED_MAX) then self.accy = SPEED_MAX end
    if(self.accy < -SPEED_MAX) then self.accy = -SPEED_MAX end

    if(self.accy < 0)then
        self.y = self.y + self.accy
        self.x, self.y = getNew(self.rot + 180, self.x, self.y, dt * SPEED_FORWARD)
        self.accy = self.accy + ACCEL_INCREASE * dt
        if (self.accy > 0 ) then self.accy = 0 end
    end
    if(self.accy > 0)then
        self.y = self.y + self.accy
        self.x, self.y = getNew(self.rot, self.x, self.y, dt * SPEED_BACKWARD)
        self.accy = self.accy - ACCEL_INCREASE * dt
        if (self.accy < 0 ) then self.accy = 0 end
    end
    if(self.accx < 0)then
        self.x = self.x + self.accx
        self.x, self.y = getNew(self.rot - 90, self.x, self.y, dt * SPEED_STRAFE)
        self.accx = self.accx + ACCEL_INCREASE * dt
        if (self.accx > 0 ) then self.accx = 0 end
    end
    if(self.accx > 0)then
        self.x = self.x + self.accx
        self.x, self.y = getNew(self.rot + 90, self.x, self.y, dt * SPEED_STRAFE)
        self.accx = self.accx - ACCEL_INCREASE * dt
        if (self.accx < 0 ) then self.accx = 0 end
    end
end

function PLAYER:draw()
    love.graphics.draw(self.sprite, math.floor(self.x) , math.floor(self.y),deg2rad(self.rot), 1, 1,
        self.sprite:getHeight() / 2, self.sprite:getWidth() / 2)
end


return PLAYER