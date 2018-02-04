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
    -- self:checkSelectedNeighbors()
end

-- function gamemanager:checkSelectedNeighbors()
--     local i = self.selection.i
--     local j = self.selection.j
--     if i > 1 then

--     end
-- end


gamemanager:init()
return gamemanager
