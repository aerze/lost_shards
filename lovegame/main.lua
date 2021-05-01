local lost_shards = require('lost_shards.main')

-- local os = love.system.getOS()
-- local status = 'os: ' .. os;
-- local pressed = '';
-- local ax = {}

function love.load()
  lost_shards.load()
  -- if (os == 'Android') then
  --     local fscreen = love.window.setFullscreen(true, 'desktop')
  --     status = status .. ', ' .. tostring(fscreen)
  -- else
  --     status = status .. ', ' .. 'nil'
  -- end
end

function love.update(dt)
  lost_shards.update(dt)
end

function love.draw()
  lost_shards.draw()
  -- love.graphics.print('hello world ' .. status, 120, 200)
  -- love.graphics.print(pressed, 120, 220);
  -- local joysticks = love.joystick.getJoysticks()
  -- -- for i, joystick in ipairs(joysticks) do
  -- --     love.graphics.print(joystick:getName(), 10, i * 20);
  -- -- end

  -- local i = 0
  -- for k, v in pairs(ax) do
  --     i = i + 1
  --     love.graphics.print(v, 120, 240 + (i * 20))
  -- end
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

  -- local name = joystick:getName()
  -- local hats = joystick:getHatCount()
  -- local buttons = joystick:getButtonCount()
  -- local axis = joystick:getAxisCount()

  -- pressed = string.format('%s, hats:%d, buttons:%d, axis:%d\nlast pressed:%s', name, hats, buttons, axis, button)
end

-- function love.gamepadaxis(joystick, axis, value)
--     ax[axis] = string.format('axis:%s, value:%d', axis, value)
-- end
