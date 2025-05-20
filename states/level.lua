local utils = require('utils')
local state_manager = require('state-manager')

local level = {}

function level:enter(from, number)
    self.number = number or 1
    self.started = false

    local image_data = love.image.newImageData('assets/level' .. self.number .. '.png')
    self.background = {
        image_data = image_data,
        image = love.graphics.newImage(image_data)
    }

    self.button = utils.create_button(nil, nil, 'assets/start.png')

    if self.number == 1 then
        self.button.x = 6
        self.button.y = 105
    elseif self.number == 2 then
        self.button.x = 6
        self.button.y = 383
    elseif self.number == 3 then
        self.button.x = 22
        self.button.y = 379
    end
end

function level:mousepressed(xmouse, ymouse, button)
    if self.started then return end

    if button ~= 1 then return end

    if utils.is_inside_rect(xmouse, ymouse, self.button) then
        self.started = true
    end
end

function level:mousemoved(xmouse, ymouse)
    if not self.started then return end

    local r, g, b = self.background.image_data:getPixel(xmouse, ymouse)

    if r == 0 and g == 0 and b == 0 then
        state_manager.switch(require('states.game-over'))
    end

    if r == 1 and g == 0 and b == 0 and self.number < 3 then
        state_manager.switch(level, self.number + 1)
    end

    if self.number == 3 and ymouse <= 122 then
        state_manager.switch(require('states.jumpscare'))
    end
end

function level:draw()
    love.graphics.draw(self.background.image)

    if not self.started then
        love.graphics.draw(self.button.image, self.button.x, self.button.y)
    end
end

return level