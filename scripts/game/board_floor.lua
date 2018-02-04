local board_floor = {}

function board_floor:init()
    self.mt = {}
    for i=1, measure.square_height do
        self.mt[i] = {}
        for j=1, measure.square_width do
            self.mt[i][j] = 'floor'
        end
    end

    -- water
    self.mt[2][4] = 'water'
    self.mt[2][5] = 'water'
    self.mt[2][6] = 'water'
    self.mt[3][4] = 'water'
    self.mt[3][5] = 'water'
    self.mt[3][6] = 'water'

    self.mt[5][4] = 'water'
    self.mt[5][5] = 'water'
    self.mt[5][6] = 'water'
    self.mt[6][4] = 'water'
    self.mt[6][5] = 'water'
    self.mt[6][6] = 'water'

    -- white traps and den
    self.mt[3][1] = 'white trap'
    self.mt[4][2] = 'white trap'
    self.mt[5][1] = 'white trap'
    self.mt[4][1] = 'white den'

    -- black traps and den
    self.mt[3][9] = 'black trap'
    self.mt[4][8] = 'black trap'
    self.mt[5][9] = 'black trap'
    self.mt[4][9] = 'black den'
end

function board_floor:restart()
    self:init()
end


board_floor:init()
return board_floor
