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
