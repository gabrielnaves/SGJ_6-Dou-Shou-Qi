require("scripts.measure")
require("scripts.still_image")

function love.load(arg)
    background = still_image.new('background.png', 0, 0)
    board = still_image.new('board.png', measure.board_x, measure.board_y)
end

function love.update(dt)
end

function love.draw(dt)
    background:draw()
    board:draw()
end
