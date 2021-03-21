local Radix = require("Radix")
local uIntChar = require("8e044120a5c9892c7ec12adba5cc077d")
--local uIntChar = require("Base-2")
--local uIntChar = require("Base-10")

local charUInt = {}
for index = 1, #uIntChar do
	charUInt[uIntChar[index]] = index
end

local radix = Radix.new(#uIntChar)

local Encoder = {}

function Encoder.uIntEncode(uInt)
	local uStr = {}

	radix:SetDecimal(uInt)

	local digits = radix:GetDigits()

	for index = 1, #digits do
		uStr[index] = uIntChar[digits[index] + 1]
	end

	return uStr
end

function Encoder.uIntDecode(uStr)
	local digits = {}

	for index = 1, #uStr do
		digits[index] = charUInt[uStr[index]] - 1
	end

	radix:SetDigits(digits)

	return radix:GetDecimal()
end

return Encoder