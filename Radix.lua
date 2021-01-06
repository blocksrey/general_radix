local Radix = {}
Radix.__index = Radix

function Radix.new(base)
	local self = setmetatable({}, Radix)

	self._base = base or 10
	self._digits = {}

	return self
end

function Radix:GetBase()
	return self._base
end

function Radix:SetBase(base)
	local decimal = self:GetDecimal()

	self._base = base
	self:SetDecimal(decimal)
end

function Radix:GetDigits()
	return self._digits
end

function Radix:SetDigits(digits)
	self._digits = digits
end

function Radix:GetDecimal()
	local decimal = 0

	for index = 0, #self._digits - 1 do
		decimal = decimal + self._digits[#self._digits - index]*self._base^index
	end

	return decimal
end

function Radix:SetDecimal(decimal)
	self._digits = {}

	if decimal > 0 then
		while decimal > 0 do
			table.insert(self._digits, 1, decimal%self._base)
			decimal = math.floor(decimal/self._base)
		end
	else
		table.insert(self._digits, 0)
	end
end

function Radix:Destroy()
	self._base = nil
	self._digits = nil

	setmetatable(self, nil)
end

return Radix