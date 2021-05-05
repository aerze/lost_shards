local lost_shards = require('lost_shards.main')

function love.load()
  lost_shards.load()
end

function love.update(dt)
  lost_shards.update(dt) 
end

function love.draw()
  lost_shards.draw()
end

function love.keypressed(key)
  if (key == 'escape') then
    love.event.quit()
  end
end

function love.gamepadpressed(joystick, button)
  if (button == 'back') then
    love.event.quit()
  end
end