return {
    {
        -- Beaitiful icons
        'echasnovski/mini.icons',
        version = false,
    },

    {
        -- Inhanced textobjects for a/i motions
        'echasnovski/mini.ai',
        version = '*',
        opts = {
            n_lines = 500,
        },
    },

    {
        -- Surround capabilities
        'echasnovski/mini.surround',
        version = '*',
        opts = {
            mappings = {
                add = 'gsa', -- Add surrounding in Normal and Visual modes
                delete = 'gsd', -- Delete surrounding
                find = 'gsf', -- Find surrounding (to the right)
                find_left = 'gsF', -- Find surrounding (to the left)
                highlight = 'gsh', -- Highlight surrounding
                replace = 'gsr', -- Replace surrounding
                update_n_lines = 'gsn', -- Update `n_lines`
            },
        },
    },

    {
        -- File manager
        'echasnovski/mini.files',
        version = '*',
        opts = {
            mappings = {
                go_in = '',
                go_out = '',
                go_in_plus = '<cr>',
                go_out_plus = '-',
            },
            windows = {
                max_number = 2,
                preview = true,
                width_focus = 50,
                width_preview = 50,
            },
        },
        config = function(_, opts)
            require('mini.files').setup(opts)
            vim.keymap.set('n', '<leader>fm', function()
                require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
            end, { desc = 'Mini: [F]ile [M]anager' })
        end,
    },
}
