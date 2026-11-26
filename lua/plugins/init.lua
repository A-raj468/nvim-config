local M = {}

local parent = 'plugins'
local dir = vim.fn.stdpath 'config' .. '/lua/' .. parent

local idx = {}

local function is_configured(entry)
    return entry.build ~= nil or entry.args ~= nil or entry.keys ~= nil or entry.after ~= nil
end

for name, type in vim.fs.dir(dir) do
    if type == 'file' and name:match '%.lua$' and name ~= 'init.lua' then
        local module_name = name:gsub('%.lua$', '')
        local module = require(parent .. '.' .. module_name)

        for key, value in pairs(module) do
            local curr_idx = idx[key]

            local entry = vim.tbl_extend('force', { name = key }, value)
            entry.repo = table.remove(entry, 1)

            if not curr_idx then
                local new_idx = #M + 1
                idx[key] = new_idx

                M[new_idx] = entry
            else
                local old_entry = M[curr_idx]
                if old_entry.repo ~= entry.repo then
                    error(string.format("Conflicting repos for '%s': '%s' and '%s'", key, tostring(old_entry.repo), tostring(entry.repo)))
                end
                if is_configured(old_entry) and is_configured(entry) then
                    error(string.format("Multiple configuration found for '%s'", key))
                elseif is_configured(entry) then
                    M[curr_idx] = entry
                end
            end
        end
    end
end

return M
