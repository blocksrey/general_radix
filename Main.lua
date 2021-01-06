local Encoder = require("Encoder")

for ind = 0, 2^18 - 1 do
	local uStr = Encoder.uIntEncode(ind)
	local uInt = Encoder.uIntDecode(uStr)

	if uInt == ind then
		print(uInt, unpack(uStr))
	else
		print("ERROR: ", unpack(uStr))
	end
end

local uStr = Encoder.uIntEncode(69696969696969)
local uInt = Encoder.uIntDecode(uStr)

print(uInt, unpack(uStr))