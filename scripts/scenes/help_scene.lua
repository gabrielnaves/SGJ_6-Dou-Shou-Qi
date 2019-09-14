local help_scene = {}

function help_scene:load()
    self.background_img = still_image.new('help_menu.png')
end

function help_scene:update(dt)
    if input.mouseButtonDown then
        current_scene = require("scripts.scenes.menu_scene")
    end
end

function help_scene:draw(dt)
    self.background_img:draw()
end

function help_scene:restart()
    current_scene = require("scripts.scenes.menu_scene")
end


help_scene:load()
return help_scene
