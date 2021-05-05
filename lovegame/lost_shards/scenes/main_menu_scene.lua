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

  self.pressedLastFrame = false
  self.cursor = 1
  self.cursorPosition = 200
end

function MainMenuScene:update()
  if (self.katalyst.input:justPressed('dpdown')) then
    self.cursor = self.cursor + 1
    if (self.cursor == 4) then
      self.cursor = 0
    end
  end

  if (self.katalyst.input:justPressed('dpup')) then
    self.cursor = self.cursor - 1 
    if (self.cursor == -1) then
      self.cursor = 3
    end
  end

  self.cursorPosition = 200 + (16 * self.cursor)
end

function MainMenuScene:draw()
  love.graphics.print('continue', 200, 200)
  love.graphics.print('level select', 200, 216)
  love.graphics.print('settings', 200, 232)
  love.graphics.print('quit', 200, 200 + (16 * 3))

  love.graphics.print('>', 184, self.cursorPosition)
  
end

return MainMenuScene
