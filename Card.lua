local Encoder = require("Encoder")
local Cards = require("Cards")

for index = 1, #Cards do
	local card = Cards[index]
	local info = {}
	for prop in card:gmatch("%S+") do
		table.insert(info, prop)
	end

	local code = info[1]
	local month = info[2]
	local year = info[3]
	local CVV = info[4]

	local formatted = code..' '..month..'/'..year..' '..CVV
	local number = string.format("%.f", code)..month..year..CVV

	print(number)
	--print(string.format("%.f", number))

	local string = Encoder.uIntEncode(tonumber(number))

	io.stdout:write(formatted..": ", unpack(string))
	print()

	print(Encoder.uIntDecode(string))
	--io.stdout:write(formatted..": ", string.format(""))
	print()
end

local Card = {}

function Card.encrypt()

end

function Card.decrypt()

end

return Card