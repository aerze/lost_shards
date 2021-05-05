local Scene = require('katalyst.scene')
local SceneManager = require('katalyst.scene_manager')
local InputManager = require('katalyst.input_manager')

local Katalyst = {
  Scene = Scene,
  SceneManager = SceneManager,
  InputManager = InputManager
}

function Katalyst:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.input = InputManager:new(nil, self)
  self.scenes = SceneManager:new(nil, self)
  return o
end

function Katalyst:load()

end

function Katalyst:update(dt)
  self.input:update(dt)
  self.scenes:update(dt)
end

function Katalyst:draw()
  self.scenes:draw()
end

return Katalyst
