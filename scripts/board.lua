board = {}
board.img = love.graphics.newImage('assets/board.png')
board.x = 180
board.y = 66

function board.draw(dt)
    love.graphics.draw(board.img, board.x, board.y, 0, 1, 1)
end

return board
