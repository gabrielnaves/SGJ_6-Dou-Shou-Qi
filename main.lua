require("scripts.utility.debug")
require("scripts.utility.measure")
require("scripts.utility.still_image")
require("scripts.utility.input")

local background = nil

function love.load(arg)
    background = still_image.new('background.png')

    current_scene = require("scripts.scenes.menu_scene")
end

function love.update(dt)
    input:update()
    if current_scene ~= nil then
        current_scene:update()
    end
end

function love.draw(dt)
    background:draw()
    if current_scene ~= nil then
        current_scene:draw()
    end
end
