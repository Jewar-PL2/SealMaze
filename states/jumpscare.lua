local jumpscare = {}

function jumpscare:init()
    self.background = love.graphics.newImage('assets/jumpscare.png')
    self.jumpscare_sound = love.audio.newSource('assets/jumpscare.wav', 'static')

    self.font = love.graphics.newFont('assets/Roboto.ttf', 48, 'normal')
    self.display_text = false
    self.timer = 0

    self.jumpscare_sound:play()
end

function jumpscare:update(dt)
    self.timer = self.timer + dt

    if self.timer > 1.5 then
        self.display_text = true
    end

    if self.timer > 5.0 then
        love.event.quit()
    end
end

function jumpscare:draw()
    love.graphics.draw(self.background)

    if self.display_text then
        love.graphics.setFont(self.font)
        love.graphics.setColor(1, 0, 0, 1)

        local text1 = 'ZOSTALES STROLLOWANY'
        love.graphics.print(
            text1,
            (640 - self.font:getWidth(text1)) / 2,
            8
        )

        local text2 = 'DOSTANE ZA TO CHOCIAZ 2?'
        love.graphics.print(
            text2,
            (640 - self.font:getWidth(text2)) / 2,
            424
        )
    end

    love.graphics.reset()
end

return jumpscare