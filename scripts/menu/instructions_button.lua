local instructions_button = {}

local xPos = measure.screen_width/2
local yPos = measure.screen_height/2 + 156
instructions_button.image = still_image.new('instructions_button.png', xPos, yPos, 0.5, 0.5)
instructions_button.rect = geometry.makeRect(xPos, yPos, instructions_button.image.width, instructions_button.image.height, 0.5, 0.5)

function instructions_button:update(dt)
    if input.mouseButtonDown then
        if geometry.isPointInRect(geometry.makePoint(input.mouseX, input.mouseY), self.rect) then
            current_scene = require("scripts.scenes.help_scene")
        end
    end
end

function instructions_button:draw(dt)
    self.image:draw()
end


return instructions_button
