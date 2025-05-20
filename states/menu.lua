local utils = require('utils')
local state_manager = require('state-manager')

local menu = {}

function menu:init()
    self.background = love.graphics.newImage('assets/menu.png')
    self.button = utils.create_button(262, 369, 'assets/start.png')
end

function menu:mousepressed(xmouse, ymouse, button)
    if button ~= 1 then return end

    if utils.is_inside_rect(xmouse, ymouse, self.button) then
        state_manager.switch(require('states.level'))
    end
end

function menu:draw()
    love.graphics.draw(self.background)
    love.graphics.draw(self.button.image, self.button.x, self.button.y)
end

return menu