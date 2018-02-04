require("scripts.debug")
require("scripts.measure")
require("scripts.still_image")
require("scripts.input")

function love.load(arg)
    background = still_image.new('background.png')
    board_img = still_image.new('board.png', measure.board_x, measure.board_y)
    pieces = require("scripts.game_pieces")
    board_floor = require("scripts.board_floor")
    board = require("scripts.board")
    highlighting = require("scripts.highlighting")
    gamemanager = require("scripts.gamemanager")
end

function love.update(dt)
    input:update()
    highlighting:update()
    gamemanager:update()
end

function love.draw(dt)
    background:draw()
    board_img:draw()
    board:draw()
    highlighting:draw()
end
