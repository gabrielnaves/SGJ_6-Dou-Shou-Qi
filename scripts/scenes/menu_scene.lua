local menu_scene = {}

function menu_scene:load()
    self.title_img = still_image.new('title.png')
end

function menu_scene:update(dt)
end

function menu_scene:draw(dt)
    self.title_img:draw()
end

function menu_scene:restart()
end


menu_scene:load()
return menu_scene
