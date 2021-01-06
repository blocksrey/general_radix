local Encoder = require("Encoder")

for ind = 0, 2^12 - 1 do
	local uStr = Encoder.uIntEncode(ind)
	local uInt = Encoder.uIntDecode(uStr)

	if uInt ~= ind then
		print("ERROR: ")
	end

	print(uInt, unpack(uStr))
end