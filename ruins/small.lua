local ruins = {
    ["base"               ] = {},
    ["fire-place"         ] = {},
    ["factorio-crash-site"] = {},
    ["RealisticReactors"  ] = {},
}

local function add(ruins, n, name)
    for i = 1, n do
        table.insert(ruins, require(string.format(name, i)))
    end
end

-- base
table.insert(ruins["base"], require("ruins.small.burner-generator"))
table.insert(ruins["base"], require("ruins.small.corpse"))
add(ruins["base"], 5, "ruins.small.crash-%d-ship-wreck")
add(ruins["base"], 11, "ruins.small.crash-%d-ship-part")

-- fire-place
table.insert(ruins["fire-place"], require("ruins.small.camp-cold"))
table.insert(ruins["fire-place"], require("ruins.small.camp-trap"))
table.insert(ruins["fire-place"], require("ruins.small.camp-fire"))

-- factorio-crash-site
add(ruins["factorio-crash-site"], 2, "ruins.small.crash-%d-chest")
add(ruins["factorio-crash-site"], 1, "ruins.small.crash-%d-generator")
add(ruins["factorio-crash-site"], 1, "ruins.small.crash-%d-damaged-lab")
add(ruins["factorio-crash-site"], 1, "ruins.small.crash-%d-repaired-lab")
add(ruins["factorio-crash-site"], 2, "ruins.small.crash-%d-damaged-assembling-machine")
add(ruins["factorio-crash-site"], 2, "ruins.small.crash-%d-repaired-assembling-machine")

-- RealisticReactors
table.insert(ruins["RealisticReactors"], require("ruins.small.radioactive-waste-storage"))
table.insert(ruins["RealisticReactors"], require("ruins.small.radioactive-sarcophagus"))

return ruins
