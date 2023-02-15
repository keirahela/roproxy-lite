local module = {}
module.__index = module

function module.new(cash)
  if getfenv(2).script.Parent:IsA("LocalScript") then return end
  local self = setmetatable({
    Cash = cash
  }, module)

  return self
end

function module:GetMoney()
  return self.Cash
end

function module:AddMoney(newCash)
  if getfenv(2).script.Parent:IsA("LocalScript") then return end
    if type(self.Cash) == "number" then
      if type(newCash) == "number" then
        self.Cash += newCash
      end
    end
end

return module
