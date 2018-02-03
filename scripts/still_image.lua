still_image = {}

function still_image.new(img_name, xPos, yPos)
    return {
        img = love.graphics.newImage('assets/' .. img_name),
        x = xPos,
        y = yPos,

        draw = function(self, dt)
            love.graphics.draw(self.img, self.x, self.y)
        end
    }
end
