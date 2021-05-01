
local SceneManager = {}

function SceneManager:new(o, katalyst)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.katalyst = katalyst
  self.scene = nil
  self.scenes = {}
  return o
end

function SceneManager:add(key, Scene)
  self.scenes[key] = Scene:new(nil, self.katalyst)
end

function SceneManager:start(key)
  local nextScene = self.scenes[key]

  if (self.scene == nil) then
    self.scene = nextScene
  else
    self.scene:unload()
    self.scene = nextScene
  end

  self.scene:load()
end

function SceneManager:update(dt)
  if (self.scene ~= nil) then
    self.scene:update(dt)
  end
end

function SceneManager:draw()
  if (self.scene ~= nil) then
    self.scene:draw()
  end
end

return SceneManager
