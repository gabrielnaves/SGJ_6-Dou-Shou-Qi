still_image = {}

function still_image.new(img_name, xPos, yPos)
    xPos = xPos or 0
    yPos = yPos or 0

    local image = love.graphics.newImage('assets/' .. img_name)
    return {
        img = image,
        x = xPos,
        y = yPos,
        width = image:getWidth(),
        height = image:getHeight(),

        draw = function(self)
            love.graphics.draw(self.img, self.x, self.y)
        end
    }
end

function still_image.new_centered(img_name, xPos, yPos)
    xPos = xPos or 0
    yPos = yPos or 0

    local image = love.graphics.newImage('assets/' .. img_name)
    return {
        img = image,
        x = xPos,
        y = yPos,
        width = image:getWidth(),
        height = image:getHeight(),

        draw = function(self)
            love.graphics.draw(self.img, self.x - self.img:getWidth()/2, self.y - self.img:getHeight()/2)
        end
    }
end
