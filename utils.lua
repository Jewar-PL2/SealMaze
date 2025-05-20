local utils = {}

function utils.is_inside_rect(x, y, rect)
    return x >= rect.x and x <= rect.x + rect.width and y >= rect.y and y <= rect.y + rect.height
end

function utils.create_button(x, y, image_path)
    local image = love.graphics.newImage(image_path)

    return {
        x = x,
        y = y,
        width = image:getWidth(),
        height = image:getHeight(),
        image = image
    }
end

return utils