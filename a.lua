local RunService = game:GetService("RunService")

local module = {}
module.__index = module

function get()
    if RunService:IsServer() then
        return "Server"
    elseif RunService:IsClient() then
        return "Client"
    end
end

function module.new(cash)
  print(getfenv(2).script)
  if get() == "Client" then return end
  local self = setmetatable({
    Cash = cash
  }, module)

  return self
end

function module:GetMoney()
  return self.Cash
end

function module:AddMoney(newCash)
  if get() == "Client" then return end
  if type(self.Cash) == "number" then
    if type(newCash) == "number" then
      self.Cash += newCash
    end
  end
end
