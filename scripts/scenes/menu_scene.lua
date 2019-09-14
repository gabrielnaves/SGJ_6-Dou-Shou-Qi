local menu_scene = {}

menu_scene.name = 'menu'

function menu_scene:load()
    self.title_img = still_image.new('title.png')
    self.play_button = require("scripts.menu.play_button")
    self.instructions_button = require("scripts.menu.instructions_button")
end

function menu_scene:update(dt)
    self.play_button:update()
    self.instructions_button:update()
end

function menu_scene:draw(dt)
    self.title_img:draw()
    self.play_button:draw()
    self.instructions_button:draw()
end

function menu_scene:restart()
end


menu_scene:load()
return menu_scene
