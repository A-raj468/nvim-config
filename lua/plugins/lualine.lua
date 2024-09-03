return {
    {
        -- Status line
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('lualine').setup {
                sections = {
                    lualine_x = {
                        require('pomodoro').statusline,
                        'encoding',
                        'fileformat',
                        'filetype',
                    },
                },
            }
        end,
    },
}
