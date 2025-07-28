local ruins = {
    ["base"] = {},
}

-- base
table.insert(ruins["base"], require("river1"))
table.insert(ruins["base"], require("river2"))
table.insert(ruins["base"], require("river3"))
table.insert(ruins["base"], require("minefield"))
table.insert(ruins["base"], require("ship-crash-site"))

return ruins
