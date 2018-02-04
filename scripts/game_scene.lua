local game_scene = {}

function game_scene:load()
    -- Object loading
    self.board_img = still_image.new('board.png', measure.board_x, measure.board_y)
    self.pieces = require("scripts.game_pieces")
    self.board_floor = require("scripts.board_floor")
    self.board = require("scripts.board")
    self.highlighting = require("scripts.highlighting")
    self.gamemanager = require("scripts.gamemanager")

    -- Dependency setup
    self.board.pieces = self.pieces
    self.gamemanager.board = self.board
    self.gamemanager.highlighting = self.highlighting
    self.gamemanager.board_floor = self.board_floor
end

function game_scene:update(dt)
    self.highlighting:update()
    self.gamemanager:update()
end

function game_scene:draw(dt)
    self.board_img:draw()
    self.board:draw()
    self.highlighting:draw()
    self.gamemanager:draw()
end

function game_scene:restart()

end


game_scene:load()
return game_scene
