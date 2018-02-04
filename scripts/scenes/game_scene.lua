local game_scene = {}

game_scene.name = 'game'

function game_scene:load()
    -- Object loading
    self.board_img = still_image.new('board.png', measure.board_x, measure.board_y)
    self.pieces = require("scripts.game.game_pieces")
    self.board_floor = require("scripts.game.board_floor")
    self.board = require("scripts.game.board")
    self.highlighting = require("scripts.game.highlighting")
    self.gamemanager = require("scripts.game.gamemanager")
    self.captures = require("scripts.game.captures")

    -- Dependency setup
    self.board.pieces = self.pieces
    self.gamemanager.board = self.board
    self.gamemanager.highlighting = self.highlighting
    self.gamemanager.board_floor = self.board_floor
    self.captures.pieces = self.pieces
    self.gamemanager.captures = self.captures
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
    self.captures:draw()
end

function game_scene:restart()
    self.board_floor:restart()
    self.board:restart()
    self.gamemanager:restart()
    self.captures:restart()
end


game_scene:load()
return game_scene
