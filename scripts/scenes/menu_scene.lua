local menu_scene = {}

menu_scene.name = 'menu'

function menu_scene:load()
    self.title_img = still_image.new('title.png')
    self.play_button = require("scripts.menu.play_button")
end

function menu_scene:update(dt)
    self.play_button:update()
end

function menu_scene:draw(dt)
    self.title_img:draw()
    self.play_button:draw()
end

function menu_scene:restart()
end


menu_scene:load()
return menu_scene
