
local InputManager = {}

function InputManager:new(o, katalyst)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.katalyst = katalyst
  self.inputState = {
    a = false,
    b = false,
    x = false,
    y = false,
    back = false,
    guide = false,
    start = false,
    dpup = false,
    dpdown = false,
    dpleft = false,
    dpright = false
  }
  self.pressedState = {
    a = false,
    b = false,
    x = false,
    y = false,
    back = false,
    guide = false,
    start = false,
    dpup = false,
    dpdown = false,
    dpleft = false,
    dpright = false
  }
  return o
end

function InputManager:update(dt)
  local joystick = love.joystick.getJoysticks(0)[1]
  for buttonName, wasDown in pairs(self.inputState) do
    local isDown = joystick:isGamepadDown(buttonName)
    
    if (isDown) then
      if (wasDown) then
        self.pressedState[buttonName] = false
      else
        self.inputState[buttonName] = true
        self.pressedState[buttonName] = true
      end
    else
      if (wasDown) then
        self.inputState[buttonName] = false
      end
    end

    -- if (isDown and not wasDown) then
    --   self.inputState[buttonName] = true
    --   self.pressedState[buttonName] = true
    -- elseif (isDown and wasDown) then
    --   self.pressedState[buttonName] = false
    -- elseif (not isDown and wasDown) then
    --   self.inputState[buttonName] = false
    -- end
  end
end

function InputManager:justPressed(buttonName)
  return self.pressedState[buttonName]
end

return InputManager
