local Scene = require('katalyst.scene')
local SceneManager = require('katalyst.scene_manager')

local Katalyst = {
  Scene = Scene,
  SceneManager = SceneManager
}

function Katalyst:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.sceneManager = SceneManager:new(nil, self)
  return o
end

function Katalyst:load()

end

function Katalyst:update(dt)
  self.sceneManager:update(dt)
end

function Katalyst:draw()
  self.sceneManager:draw()
end

return Katalyst
