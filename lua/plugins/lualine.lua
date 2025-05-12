return {
    {
        -- Status line
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            sections = {
                lualine_x = {
                    {
                        require('noice').api.statusline.mode.get,
                        cond = require('noice').api.statusline.mode.has,
                        color = { fg = '#ff9e64' },
                    },
                    function()
                        local ok, pomo = pcall(require, 'pomo')
                        if not ok then
                            return ''
                        end

                        local timer = pomo.get_first_to_finish()
                        if timer == nil then
                            return ''
                        end

                        return '󰄉 ' .. tostring(timer)
                    end,
                    'encoding',
                    'fileformat',
                    'filetype',
                },
            },
        },
    },
}
