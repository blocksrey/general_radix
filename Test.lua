local Encoder = require("Encoder")

for ind = 0, 2^12 - 1 do
	local uStr = Encoder.uIntEncode(ind)
	local uInt = Encoder.uIntDecode(uStr)

	if uInt ~= ind then
		print("ERROR: ")
	end
end

for i = 1, 77000 do
	io.stdout:write(unpack(Encoder.uIntEncode(i)))
	print()
end