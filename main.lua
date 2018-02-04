require("scripts.debug")
require("scripts.measure")
require("scripts.still_image")
require("scripts.input")

local background = nil

function love.load(arg)
    background = still_image.new('background.png')

    currentScene = require("scripts.game_scene")
end

function love.update(dt)
    input:update()
    if currentScene ~= nil then
        currentScene:update()
    end
end

function love.draw(dt)
    background:draw()
    if currentScene ~= nil then
        currentScene:draw()
    end
end
