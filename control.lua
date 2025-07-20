local ruin_set = require("ruins/realistic") -- an array of ruins

local function add(name, parent)
    local ruins = remote.call("AbandonedRuins", "get_ruin_set", parent)

    if not ruins then
        log(string.format("WARNING: Parent ruin '%s' not found!", parent))
        return
    end

    for size, set in pairs(ruin_set) do
        for name, rest in pairs(set) do
            if script.active_mods[name] then
                for _, ruin in ipairs(rest) do
                    table.insert(ruins[size], ruin)
                end
            end
        end
    end

    remote.call("AbandonedRuins", "add_ruin_sets", name, ruins)
end

local function make_ruin_set()
    local set = settings.global["current-ruin-set"]

    set.default_value = "realistic"
    if set.allowed_values == nil then
        set.allowed_values = {"base"}
    end

    table.insert(set.allowed_values, "realistic")

    if script.active_mods["AbandonedRuins-Krastorio2"] then
        table.insert(set.allowed_values, "realistic-krastorio")
        set.default_value = "realistic-krastorio"
    end

    add("realistic", "base")

    if script.active_mods["AbandonedRuins-Krastorio2"] then
        add("realistic-krastorio", "krastorio2")
    end
end

script.on_init(make_ruin_set)
script.on_configuration_changed(make_ruin_set)
--script.on_nth_tick(1, function ()
--    script.on_nth_tick(1, nil)
--    make_ruin_set()
--end)
