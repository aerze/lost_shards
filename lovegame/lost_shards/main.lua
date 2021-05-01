local katalyst = require('katalyst.katalyst'):new()
local lost_shards = {}

function lost_shards.load()
  katalyst:load();
  katalyst.sceneManager:add('boot', require('lost_shards.scenes.boot_scene'))
  katalyst.sceneManager:add('main_menu', require('lost_shards.scenes.main_menu_scene'))
  katalyst.sceneManager:start('boot')
end

function lost_shards.update(dt)
  katalyst:update(dt)
end

function lost_shards.draw()
  katalyst:draw()
end



return lost_shards
