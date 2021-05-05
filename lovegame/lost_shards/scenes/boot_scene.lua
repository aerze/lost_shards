local Scene = require('katalyst.scene')

local BootScene = Scene:new()

function BootScene:new(o, katalyst)
  o = o or Scene:new(nil, katalyst)
  setmetatable(o, self)
  self.__index = self
  return o
end

function BootScene:load()
  self.time = love.timer.getTime()
  self.timeLimit = self.time + 1

  -- set window to fullscreen for retroid
  if (love.system.getOS() == 'Android') then
    love.window.setFullscreen(true, 'desktop')
  end
end

function BootScene:update()
  self.time = love.timer.getTime()
  if (self.time > self.timeLimit) then
    self.katalyst.scenes:start('main_menu')
  end
end

function BootScene:draw()
  love.graphics.print(string.format('boot\n%d\n%d', self.timeLimit, self.time), 200, 200)
end

return BootScene
