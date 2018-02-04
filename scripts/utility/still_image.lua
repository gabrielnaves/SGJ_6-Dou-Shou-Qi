still_image = {}

function still_image.new(img_name, x, y, pivotX, pivotY)
    x = x or 0.0
    y = y or 0.0
    pivotX = pivotX or 0.0
    pivotY = pivotY or 0.0

    local image = love.graphics.newImage('assets/' .. img_name)
    return {
        img = image,
        x = x,
        y = y,
        pivotX = pivotX,
        pivotY = pivotY,
        width = image:getWidth(),
        height = image:getHeight(),

        draw = function(self)
            love.graphics.draw(self.img, self.x - self.width*self.pivotX, self.y - self.height*self.pivotY)
        end
    }
end
