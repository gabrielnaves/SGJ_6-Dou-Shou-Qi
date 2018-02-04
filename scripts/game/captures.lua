local captures = {}

captures.white_amount = 0
captures.white_captured = {}
captures.whiteX = (measure.screen_width - measure.board_x/2 - measure.piece_size/2)

captures.black_amount = 0
captures.black_captured = {}
captures.blackX = (measure.board_x/2 - measure.piece_size/2)

function captures:draw()
    for i=1, self.white_amount do
        local height = self.white_amount * measure.piece_size
        local piece_y = (measure.screen_height/2) - (height/2) + (i-1)*measure.piece_size
        love.graphics.draw(self.pieces.img, self.pieces.frames[self.white_captured[i]], self.whiteX, piece_y)
    end
    for i=1, self.black_amount do
        local height = self.black_amount * measure.piece_size
        local piece_y = (measure.screen_height/2) - (height/2) + (i-1)*measure.piece_size
        love.graphics.draw(self.pieces.img, self.pieces.frames[self.black_captured[i]], self.blackX, piece_y)
    end
end

function captures:restart()
    self.white_amount = 0
    self.white_captured = {}
    self.black_amount = 0
    self.black_captured = {}
end

return captures
