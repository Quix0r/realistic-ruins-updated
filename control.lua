local constants = require("__AbandonedRuins_updated_fork__/lua/constants")

---@type table<string, RuinSet>
local ruin_sets = require("ruins/ruin_set")

debug_log = settings.global[constants.ENABLE_DEBUG_LOG_KEY].value

local function add(name, parent)
  if debug_log then log(string.format("[add]: name='%s',parent='%s' - CALLED!", name, parent)) end

  local ruins = remote.call("AbandonedRuins", "get_ruin_set", parent)
  if debug_log then log(string.format("[add]: ruins[]='%s'", type(ruins))) end

  if not ruins then
    log(string.format("WARNING: Parent ruin '%s' not found! Initializing empty table ...", parent))
    ruins = {}
    for _, size in pairs(remote.call("AbandonedRuins", "get_ruin_sizes")) do
      if debug_log then log(string.format("[add]: Adding size='%s' ...", size)) end
      ruins[size] = {}
    end
  end

  if debug_log then log(string.format("[add]: Checking %d ruin-sets ...", table_size(ruin_sets))) end
  for size, ruin_set in pairs(ruin_sets) do
    if debug_log then log(string.format("[add]: size='%s',ruin_set[]='%s'", size, type(ruin_set))) end
    if ruins[size] == nil then
      -- Initialize table
      if debug_log then log(string.format("[add]: Table for size='%s' not found, initializing ...", size)) end
      ruins[size] = {}
    end

    if debug_log then log(string.format("[add]: Checking %d ruin-sets for size='%s' ...", table_size(ruin_set), size)) end
    for name, ruins in pairs(ruin_set) do
      if debug_log then log(string.format("[add]: name='%s',ruins()=%d", name, table_size(ruins))) end
      for _, ruin in ipairs(ruins) do
        if debug_log then log(string.format("[add]: Adding ruin[]='%s' for size='%s' ...", type(ruin), size)) end
        table.insert(ruins[size], ruin)
      end
    end
  end

  remote.call("AbandonedRuins", "add_ruin_sets", name, ruins)

  if debug_log then log("[add]: EXIT!") end
end

local function make_ruin_set()
  if debug_log then log("[make_ruin_set]: CALLED!") end

  add("realistic", "base")

  if script.active_mods["AbandonedRuins-Krastorio2"] then
    add("realistic-krastorio", "krastorio2")
  end

  if debug_log then log("[make_ruin_set]: EXIT!") end
end

script.on_init(make_ruin_set)
script.on_configuration_changed(make_ruin_set)
script.on_load(make_ruin_set)
