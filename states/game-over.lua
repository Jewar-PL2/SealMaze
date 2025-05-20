local utils = require('utils')
local state_manager = require('state-manager')

local gameover = {}

function gameover:init()
    self.background = love.graphics.newImage('assets/gameover.png')
    self.button = utils.create_button(195, 372, 'assets/tryagain.png')
end

function gameover:mousepressed(xmouse, ymouse, button)
    if button ~= 1 then return end

    if utils.is_inside_rect(xmouse, ymouse, self.button) then
        state_manager.switch(require('states.menu'))
    end
end

function gameover:draw()
    love.graphics.draw(self.background)
    love.graphics.draw(self.button.image, self.button.x, self.button.y)
end

return gameover