local Scene = require('katalyst.scene')

local MainMenuScene = Scene:new()

function MainMenuScene:new(o, katalyst)
  o = o or Scene:new(nil, katalyst)
  setmetatable(o, self)
  self.__index = self
  return o
end

function MainMenuScene:load()
  self.minLoadTime = love.timer.getTime() + 5

  -- set window to fullscreen for retroid
  if (love.system.getOS() == 'Android') then
    love.window.setFullscreen(true, 'desktop')
  end
end

function MainMenuScene:update()

end

function MainMenuScene:draw()
  love.graphics.print('main_menu', 200, 200)
end

return MainMenuScene
