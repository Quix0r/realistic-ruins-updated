-- All ruins ordered by size
---@type table<string, Ruin[]>
local ruin_set = {}

-- Load all ruin sets
for _, size in pairs({"small", "medium", "large"}) do
	if debug_log then log(string.format("Loading ruins for size='%s' ...", size)) end
	ruin_set[size] = require(size .. "/__init__")
end

return ruin_set
