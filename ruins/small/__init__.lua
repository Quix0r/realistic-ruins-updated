-- A "list" of ruins, including their names
--- @type Ruin[]
local ruins = {}

-- Insert all ruins
for _, name in pairs({
	"burner-generator",
	"camp-cold",
	"camp-fire",
	"camp-trap",
	"corpse",
	"crash-10-ship-part",
	"crash-11-ship-part",
	"crash-1-chest",
	"crash-1-damaged-assembling-machine",
	"crash-1-damaged-lab",
	"crash-1-generator",
	"crash-1-repaired-assembling-machine",
	"crash-1-repaired-lab",
	"crash-1-ship-part",
	"crash-1-ship-wreck",
	"crash-2-chest",
	"crash-2-damaged-assembling-machine",
	"crash-2-repaired-assembling-machine",
	"crash-2-ship-part",
	"crash-2-ship-wreck",
	"crash-3-ship-part",
	"crash-3-ship-wreck",
	"crash-4-ship-part",
	"crash-4-ship-wreck",
	"crash-5-ship-part",
	"crash-5-ship-wreck",
	"crash-6-ship-part",
	"crash-7-ship-part",
	"crash-8-ship-part",
	"crash-9-ship-part",
	"radioactive-sarcophagus",
	"radioactive-waste-storage"
}) do
	if debug_log then log(string.format("Loading name='%s' ...", name)) end

	---@type Ruin Individual ruin, file' name becomes ruin's name
	local ruin = require(name)
	ruin.name = name
	ruins[#ruins + 1] = ruin
end

return ruins
