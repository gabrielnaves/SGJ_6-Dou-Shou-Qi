input = {}

input.mouseX = 0
input.mouseY = 0
input.mouseButton = false
input.mouseButtonDown = false

function input:update()
    local mouseDown = love.mouse.isDown(1)
    if mouseDown and not self.mouseButton then
        self.mouseButtonDown = true
    else
        self.mouseButtonDown = false
    end
    self.mouseButton = mouseDown
    self.mouseX = love.mouse.getX()
    self.mouseY = love.mouse.getY()
end

function love.keypressed(key)
    if key == "escape" or key == "q" then
        if current_scene ~= nil then
            if current_scene.name == 'menu' then
                love.event.quit()
            else
                current_scene:restart()
                current_scene = require("scripts.scenes.menu_scene")
            end
        end
    elseif key == "space" then
        current_scene:restart()
    end
end
