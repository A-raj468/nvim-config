vim.api.nvim_create_user_command('PackClean', function()
    local unused = vim.iter(vim.pack.get())
        :filter(function(plugin)
            return not plugin.active
        end)
        :map(function(plugin)
            return plugin.spec.name
        end)
        :totable()

    if #unused == 0 then
        print 'No unused plugins found'
        return
    end

    print('Removing unused plugins: ' .. table.concat(unused, ', '))
    vim.pack.del(unused)
end, {})

---@param repo string
---@return string
local function gh(repo)
    return 'https://github.com/' .. repo
end

local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code == 0 then
        return
    end
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = (stderr ~= '' and stderr) or (stdout ~= '' and stdout) or 'No output from build command.'
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
end

local build_cbs = {}

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind

        if kind ~= 'install' and kind ~= 'update' then
            return
        end

        local build_cb = build_cbs[name]
        if build_cb then
            local cmd = build_cb()
            if cmd then
                run_build(name, cmd, ev.data.path)
            end
        end
    end,
})

local plugins = require 'plugins'

local install_list = {}

for _, config in ipairs(plugins) do
    local pack_info = {
        src = gh(config.repo),
        name = config.name,
        version = config.version,
    }

    build_cbs[config.name] = config.build
    table.insert(install_list, pack_info)
end

vim.pack.add(install_list)

for _, config in ipairs(plugins) do
    if config.args then
        local module = require(config.name)
        if module.setup then
            module.setup(config.args)
        end
    end
    if config.after then
        config.after()
    end
    for _, entry in ipairs(config.keys or {}) do
        local lhs, rhs = entry[1], entry[2]
        vim.keymap.set(entry.mode or 'n', lhs, rhs, { desc = entry.desc })
    end
end
