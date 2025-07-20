local ruins = {
    ["base"] = {},
}

-- base
table.insert(ruins["base"], require("ruins.medium.stonering"))
table.insert(ruins["base"], require("ruins.medium.scorchmark"))
table.insert(ruins["base"], require("ruins.medium.dead-train"))

return ruins
