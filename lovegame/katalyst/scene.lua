
local Scene = {}

function Scene:new(o, katalyst)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.katalyst = katalyst
  return o
end

function Scene:load()
end

function Scene:update()
end

function Scene:draw()
end

function Scene:unload()
end

return Scene
