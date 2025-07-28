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
table.insert(ruins["base"], require("burner-generator"))
table.insert(ruins["base"], require("corpse"))
add(ruins["base"], 5, "crash-%d-ship-wreck")
add(ruins["base"], 11, "crash-%d-ship-part")

-- fire-place
table.insert(ruins["fire-place"], require("camp-cold"))
table.insert(ruins["fire-place"], require("camp-trap"))
table.insert(ruins["fire-place"], require("camp-fire"))

-- factorio-crash-site
add(ruins["factorio-crash-site"], 2, "crash-%d-chest")
add(ruins["factorio-crash-site"], 1, "crash-%d-generator")
add(ruins["factorio-crash-site"], 1, "crash-%d-damaged-lab")
add(ruins["factorio-crash-site"], 1, "crash-%d-repaired-lab")
add(ruins["factorio-crash-site"], 2, "crash-%d-damaged-assembling-machine")
add(ruins["factorio-crash-site"], 2, "crash-%d-repaired-assembling-machine")

-- RealisticReactors
table.insert(ruins["RealisticReactors"], require("radioactive-waste-storage"))
table.insert(ruins["RealisticReactors"], require("radioactive-sarcophagus"))

return ruins
