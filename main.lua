require("scripts.measure")
require("scripts.still_image")

function love.load(arg)
    board = still_image.new('board.png', measure.board_x, measure.board_y)
end

function love.update(dt)
end

function love.draw(dt)
    board:draw(dt)
end
