local gamemanager = {}

gamemanager.white_turn = true
gamemanager.states = { hovering="hovering", pieceSelected="piece selected", gameEnd="game ended" }
gamemanager.state = nil
gamemanager.updateFunction = nil
gamemanager.selection = nil
gamemanager.selection_strength = nil
gamemanager.white_won = nil

gamemanager.white_turn_image = still_image.new('white_turn.png', measure.screen_width/2, 20, 0.5, 0)
gamemanager.black_turn_image = still_image.new('black_turn.png', measure.screen_width/2, 20, 0.5, 0)
gamemanager.white_win_image = still_image.new('white_win_text.png', measure.screen_width/2, measure.screen_height/2, 0.5, 0.5)
gamemanager.black_win_image = still_image.new('black_win_text.png', measure.screen_width/2, measure.screen_height/2, 0.5, 0.5)

function gamemanager:init()
    self.state = self.states.hovering
    self.updateFunction = self.updateHovering
end

function gamemanager:update()
    self:updateFunction()
    if self.state ~= self.states.gameEnd then
        self:checkGameEnd()
    end
end

function gamemanager:updateHovering()
    local mt_index = self.board:matrixIndexFromPosition(input.mouseX, input.mouseY)
    if self:isMouseHoveringOnPlayerPiece(mt_index) then
        self.highlighting.mt[mt_index.i][mt_index.j] = self.highlighting.hover_img
        if input.mouseButtonDown then
            self.updateFunction = self.updateSelected
            self.state = self.states.pieceSelected
            self.selection = mt_index
            self.selection_strength = self.board.mt[mt_index.i][mt_index.j]
            if not self.white_turn then self.selection_strength = self.selection_strength - 8 end
        end
    end
end

function gamemanager:isMouseHoveringOnPlayerPiece(mt_index)
    if mt_index == nil then return false
    elseif self.board.mt[mt_index.i][mt_index.j] == 0 then return false
    elseif self.white_turn and self.board.mt[mt_index.i][mt_index.j] <= 8 then return true
    elseif not self.white_turn and self.board.mt[mt_index.i][mt_index.j] > 8 then return true
    else return false end
end

function gamemanager:updateSelected()
    self.highlighting.mt[self.selection.i][self.selection.j] = self.highlighting.selected_img
    self:checkMovementDirections()
    self:checkAttackDirections()
    self:checkInput()
end

function gamemanager:checkMovementDirections()
    self:checkSquareForMovement(self.selection.i-1, self.selection.j, 'up')
    self:checkSquareForMovement(self.selection.i+1, self.selection.j, 'down')
    self:checkSquareForMovement(self.selection.i, self.selection.j-1, 'left')
    self:checkSquareForMovement(self.selection.i, self.selection.j+1, 'right')
end

function gamemanager:checkSquareForMovement(i, j, dir)
    if i > 0 and i < measure.square_height+1 and j > 0 and j < measure.square_width+1 then
        local floor = self.board_floor.mt[i][j]
        local animal = self.board.mt[i][j]

        if floor == 'floor' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif floor == 'water' then
            self:checkMovementOnWater(i, j, dir)
        elseif self.white_turn and floor == 'white trap' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif self.white_turn and floor == 'black trap' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif not self.white_turn and floor == 'white trap' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif not self.white_turn and floor == 'black trap' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif self.white_turn and floor == 'black den' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        elseif not self.white_turn and floor == 'white den' then
            self.highlighting.mt[i][j] = self.highlighting.move_img
        end
    end
end

function gamemanager:checkMovementOnWater(i, j, dir)
    if self.selection_strength == 1 then
        self.highlighting.mt[i][j] = self.highlighting.move_img
    elseif self.selection_strength == 6 or self.selection_strength == 7 then
        if self.board.mt[i][j] == 0 then
            if dir == 'up' then
                if self.board.mt[i-1][j] == 0 then
                    self.highlighting.mt[i-2][j] = self.highlighting.move_img
                end
            elseif dir == 'down' then
                if self.board.mt[i+1][j] == 0 then
                    self.highlighting.mt[i+2][j] = self.highlighting.move_img
                end
            elseif dir == 'left' then
                if self.board.mt[i][j-2] == 0 and self.board.mt[i][j-1] == 0 then
                    self.highlighting.mt[i][j-3] = self.highlighting.move_img
                end
            elseif dir == 'right' then
                if self.board.mt[i][j+2] == 0 and self.board.mt[i][j+1] == 0 then
                    self.highlighting.mt[i][j+3] = self.highlighting.move_img
                end
            end
        end
    end
end

function gamemanager:checkAttackDirections()
    for i=1, measure.square_height do
        for j=1, measure.square_width do
            if self.highlighting.mt[i][j] == self.highlighting.move_img then
                if self.board.mt[i][j] ~= 0 then
                    if (self.white_turn and self.board.mt[i][j] <= 8) or (not self.white_turn and self.board.mt[i][j] > 8) then
                        self.highlighting.mt[i][j] = nil -- Animal is ally
                    else -- Animal is an enemy
                        -- Calculate enemy strength
                        local enemy_strength = self.board.mt[i][j]
                        if self.white_turn then enemy_strength = enemy_strength - 8 end
                        if self.white_turn and self.board_floor.mt[i][j] == 'white trap' then enemy_strength = 0 end
                        if not self.white_turn and self.board_floor.mt[i][j] == 'black trap' then enemy_strength = 0 end

                        -- Check if attack is valid
                        if self.selection_strength == 1 and enemy_strength == 8 then
                            self.highlighting.mt[i][j] = self.highlighting.attack_img
                        elseif self.selection_strength == 8 and enemy_strength == 1 then
                            self.highlighting.mt[i][j] = nil
                        elseif self.selection_strength >= enemy_strength then
                            self.highlighting.mt[i][j] = self.highlighting.attack_img
                        else
                            self.highlighting.mt[i][j] = nil
                        end
                    end
                end
            end
        end
    end
end

function gamemanager:checkInput()
    if input.mouseButtonDown then
        local mt_index = self.board:matrixIndexFromPosition(input.mouseX, input.mouseY)
        if not mt_index then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
        elseif not self.highlighting.mt[mt_index.i][mt_index.j] or self.highlighting.mt[mt_index.i][mt_index.j] == self.highlighting.selected_img then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
        elseif self.highlighting.mt[mt_index.i][mt_index.j] == self.highlighting.move_img then
            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
            self.board.mt[mt_index.i][mt_index.j] = self.board.mt[self.selection.i][self.selection.j]
            self.board.mt[self.selection.i][self.selection.j] = 0
            self.white_turn = not self.white_turn
        elseif self.highlighting.mt[mt_index.i][mt_index.j] == self.highlighting.attack_img then
            if self.white_turn then
                self.captures.black_amount = self.captures.black_amount + 1
                self.captures.black_captured[self.captures.black_amount] = self.board.mt[mt_index.i][mt_index.j]
            else
                self.captures.white_amount = self.captures.white_amount + 1
                self.captures.white_captured[self.captures.white_amount] = self.board.mt[mt_index.i][mt_index.j]
            end

            self.state = self.states.hovering
            self.updateFunction = self.updateHovering
            self.board.mt[mt_index.i][mt_index.j] = self.board.mt[self.selection.i][self.selection.j]
            self.board.mt[self.selection.i][self.selection.j] = 0
            self.white_turn = not self.white_turn
        end
    end
end

function gamemanager:checkGameEnd()
    if self.captures.black_amount == 8 then
        self.white_won = true
    elseif self.captures.white_amount == 8 then
        self.white_won = false
    elseif self.board.mt[4][1] ~= 0 then
        self.white_won = false
    elseif self.board.mt[4][9] ~= 0 then
        self.white_won = true
    else
        self.white_won = nil
    end
    if self.white_won ~= nil then
        self.state = self.states.gameEnd
        self.updateFunction = self.updateGameEnd
    end
end

function gamemanager:updateGameEnd()
    -- Restarting conditions are also checked on input module
    if input.mouseButtonDown then
        current_scene:restart()
    end
end

function gamemanager:draw()
    if self.state ~= self.states.gameEnd then
        if self.white_turn then
            self.white_turn_image:draw()
        else
            self.black_turn_image:draw()
        end
    else
        if self.white_won then
            self.white_win_image:draw()
        else
            self.black_win_image:draw()
        end
    end
end

function gamemanager:restart()
    self.white_turn = true
    self.state = self.states.hovering
    self.updateFunction = self.updateHovering
    self.white_won = nil
end


gamemanager:init()
return gamemanager
