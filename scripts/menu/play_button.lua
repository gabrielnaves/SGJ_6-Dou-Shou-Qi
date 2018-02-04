local play_button = {}

local xPos = measure.screen_width/2
local yPos = measure.screen_height/2
play_button.image = still_image.new_centered('play_button.png', xPos, yPos)

play_button.rect = geometry.makeRect(xPos, yPos, play_button.image.width, play_button.image.height, 0.5, 0.5)

function play_button:update(dt)
    if input.mouseButtonDown then
        if geometry.isPointInRect(geometry.makePoint(input.mouseX, input.mouseY), self.rect) then
            current_scene = require("scripts.scenes.game_scene")
        end
    end
end

function play_button:draw(dt)
    self.image:draw()
end


return play_button
