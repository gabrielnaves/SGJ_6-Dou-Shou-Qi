require("scripts.measurements")
require("scripts.game_input")
require("scripts.game_math")

function love.load(arg)
    board = require("scripts.board")
end

function love.update(dt)
end

function love.draw(dt)
    board.draw(dt)
end
