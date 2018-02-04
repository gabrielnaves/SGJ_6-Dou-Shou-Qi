local pieces = {}

pieces.img = love.graphics.newImage('assets/game pieces.png')
pieces.num_frames = measure.piece_amount
pieces.frame_width = measure.piece_size
pieces.frame_height = measure.piece_size
pieces.frames = {
    love.graphics.newQuad(pieces.frame_width * 0, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 1, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 2, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 3, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 4, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 5, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 6, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 7, 0, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),

    love.graphics.newQuad(pieces.frame_width * 0, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 1, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 2, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 3, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 4, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 5, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 6, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
    love.graphics.newQuad(pieces.frame_width * 7, pieces.frame_height, pieces.frame_width, pieces.frame_height, pieces.img:getWidth(), pieces.img:getHeight()),
}

return pieces
