local highlighting = {}

highlighting.img = love.graphics.newImage('assets/highlightings.png')
highlighting.num_frames = 4
highlighting.frame_width = highlighting.img:getWidth() / highlighting.num_frames
highlighting.frame_height = highlighting.img:getHeight()

highlighting.attack_img = love.graphics.newQuad(0, 0, highlighting.frame_width, highlighting.frame_height, highlighting.img:getWidth(), highlighting.img:getHeight())
highlighting.move_img = love.graphics.newQuad(highlighting.frame_width, 0, highlighting.frame_width, highlighting.frame_height, highlighting.img:getWidth(), highlighting.img:getHeight())
highlighting.hover_img = love.graphics.newQuad(highlighting.frame_width*2, 0, highlighting.frame_width, highlighting.frame_height, highlighting.img:getWidth(), highlighting.img:getHeight())
highlighting.selected_img = love.graphics.newQuad(highlighting.frame_width*3, 0, highlighting.frame_width, highlighting.frame_height, highlighting.img:getWidth(), highlighting.img:getHeight())

function highlighting:init()
    self.mt = {}
    for i=1, measure.square_height do
        self.mt[i] = {}
        for j=1, measure.square_width do
            self.mt[i][j] = nil
        end
    end
end

function highlighting:update()
    for i=1, measure.square_height do
        for j=1, measure.square_width do
            self.mt[i][j] = nil
        end
    end
end

function highlighting:draw()
    for i=1, measure.square_height do
        for j=1, measure.square_width do
            if self.mt[i][j] ~= nil then
                love.graphics.draw(highlighting.img, self.mt[i][j], self.drawX(j), self.drawY(i))
            end
        end
    end
end

function highlighting.drawX(j)
    j = j - 1
    local start_x = measure.board_x + 4
    return start_x + j * measure.piece_size + j*2
end

function highlighting.drawY(i)
    i = i - 1
    local start_y = measure.board_y + 4
    return start_y + i * measure.piece_size + i*2
end


highlighting:init()
return highlighting
