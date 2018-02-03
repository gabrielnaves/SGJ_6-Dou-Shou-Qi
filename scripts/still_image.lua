still_image = {}

function still_image.new(img_name, xPos, yPos)
    xPos = xPos or 0
    yPos = yPos or 0

    return {
        img = love.graphics.newImage('assets/' .. img_name),
        x = xPos,
        y = yPos,

        draw = function(self)
            love.graphics.draw(self.img, self.x, self.y)
        end
    }
end
