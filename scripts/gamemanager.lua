local gamemanager = {}

gamemanager.white_turn = true
gamemanager.states = { hovering="hovering", pieceSelected="piece selected" }
gamemanager.state = nil
gamemanager.updateFunction = nil
gamemanager.selection = nil
gamemanager.selection_strength = nil

function gamemanager:init()
    self.state = self.states.hovering
    self.updateFunction = self.updateHovering
end

function gamemanager:update()
    self:updateFunction()
end

function gamemanager:updateHovering()
    local mt_index = board:matrixIndexFromPosition(input.mouseX, input.mouseY)
    if self:isMouseHoveringOnPlayerPiece(mt_index) then
        highlighting.mt[mt_index.i][mt_index.j] = highlighting.hover_img
        if input.mouseButtonDown then
            self.updateFunction = self.updateSelected
            self.state = self.states.pieceSelected
            self.selection = mt_index
            self.selection_strength = board.mt[mt_index.i][mt_index.j]
            if not self.white_turn then self.selection_strength = self.selection_strength - 8 end
        end
    end
end

function gamemanager:isMouseHoveringOnPlayerPiece(mt_index)
    if mt_index == nil then return false
    elseif board.mt[mt_index.i][mt_index.j] == 0 then return false
    elseif self.white_turn and board.mt[mt_index.i][mt_index.j] <= 8 then return true
    elseif not self.white_turn and board.mt[mt_index.i][mt_index.j] > 8 then return true
    else return false end
end

function gamemanager:updateSelected()
    highlighting.mt[self.selection.i][self.selection.j] = highlighting.selected_img
    self:checkMovementDirections()
    self:checkInput()
end

function gamemanager:checkMovementDirections()
    self:checkSquareForMovement(self.selection.i-1, self.selection.j)
    self:checkSquareForMovement(self.selection.i+1, self.selection.j)
    self:checkSquareForMovement(self.selection.i, self.selection.j-1)
    self:checkSquareForMovement(self.selection.i, self.selection.j+1)
end

function gamemanager:checkSquareForMovement(i, j)
    if i > 0 and i < measure.square_height+1 and j > 0 and j < measure.square_width+1 then
        if board.mt[i][j] == 0 then -- No other piece
            if board_floor.mt[i][j] == 'floor' or board_floor.mt[i][j] == 'white trap' or
            board_floor.mt[i][j] == 'black trap' then
                highlighting.mt[i][j] = highlighting.move_img
            end
            if self.selection_strength == 1 and board_floor.mt[i][j] == 'water' then
                highlighting.mt[i][j] = highlighting.move_img
            end
        end
    end
end

function gamemanager:checkInput()
    if input.mouseButtonDown then
        local mt_index = board:matrixIndexFromPosition(input.mouseX, input.mouseY)
        if not mt_index then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
        elseif not highlighting.mt[mt_index.i][mt_index.j] or highlighting.mt[mt_index.i][mt_index.j] == highlighting.selected_img then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
        elseif highlighting.mt[mt_index.i][mt_index.j] == highlighting.move_img then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
            board.mt[mt_index.i][mt_index.j] = board.mt[self.selection.i][self.selection.j]
            board.mt[self.selection.i][self.selection.j] = 0
            self.white_turn = not self.white_turn
        end
    end
end

function gamemanager:draw()
    love.graphics.print('Game state: ' .. self.state, 5, 5)
end


gamemanager:init()
return gamemanager
