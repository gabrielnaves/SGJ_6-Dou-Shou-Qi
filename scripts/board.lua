local board = {}

function board:init()
    self.mt = {}
    for i=1, measure.square_height do
        self.mt[i] = {}
        for j=1, measure.square_width do
            self.mt[i][j] = 0
        end
    end

    -- white pieces
    self.mt[1][1] = 6
    self.mt[1][3] = 8
    self.mt[2][2] = 2
    self.mt[3][3] = 3
    self.mt[5][3] = 5
    self.mt[6][2] = 4
    self.mt[7][1] = 7
    self.mt[7][3] = 1

    -- black pieces
    self.mt[1][7] = 9
    self.mt[1][9] = 15
    self.mt[2][8] = 12
    self.mt[3][7] = 13
    self.mt[5][7] = 11
    self.mt[6][8] = 10
    self.mt[7][7] = 16
    self.mt[7][9] = 14
end

function board:draw()
    for i=1, measure.square_height do
        for j=1, measure.square_width do
            if self.mt[i][j] ~= 0 then
                love.graphics.draw(pieces.img, pieces.frames[self.mt[i][j]], self.drawX(j), self.drawY(i))
            end
        end
    end
end

function board.drawX(j)
    j = j - 1
    local start_x = measure.board_x + 4
    return start_x + j * measure.piece_size + j*2
end

function board.drawY(i)
    i = i - 1
    local start_y = measure.board_y + 4
    return start_y + i * measure.piece_size + i*2
end

function board:matrixIndexFromPosition(x, y)
    if board.isPointInBoard(x, y) then
        x = x - (measure.board_x + 4)
        y = y - (measure.board_y + 4)
        return {
            i = math.ceil(y / ((measure.board_height - 8) / measure.square_height)),
            j = math.ceil(x / ((measure.board_width - 8) / measure.square_width))
        }
    end
    return nil
end

function board.isPointInBoard(x, y)
    return x > measure.board_x+4 and x < measure.board_x+measure.board_width-4 and
           y > measure.board_y+4 and y < measure.board_y+measure.board_height-4
end


board:init()
return board
