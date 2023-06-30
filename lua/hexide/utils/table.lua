local function spreadTables (...)
    local mTable = {}
    local args = {...}
    for _,arg in ipairs(args) do
        for _,item in ipairs(arg) do
            table.insert(mTable, item)
        end
    end
    return mTable
end

local M = {
    spreadTables = spreadTables
}

return M
