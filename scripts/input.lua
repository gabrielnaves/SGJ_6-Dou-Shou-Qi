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
