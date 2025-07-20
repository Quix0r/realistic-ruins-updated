local ruins = {
    ["base"] = {},
}

-- base
table.insert(ruins["base"], require("ruins.large.river1"))
table.insert(ruins["base"], require("ruins.large.river2"))
table.insert(ruins["base"], require("ruins.large.river3"))
table.insert(ruins["base"], require("ruins.large.minefield"))
table.insert(ruins["base"], require("ruins.large.ship-crash-site"))

return ruins
