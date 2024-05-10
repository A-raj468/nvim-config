return {
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {}
        end,
    },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000, -- make sure to load this before all the other start plugins
        init = function()
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'catppuccin-latte', 'catppuccin-frappe', 'catppuccin-macchiato', 'catppuccin-mocha'
            -- I prefet 'catppuccin-mocha'

            -- You can configure highlights by doing something like
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'folke/tokyonight.nvim',
        priority = 1000, -- make sure to load this before all the other start plugins
        init = function()
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            -- I prefet tokyonight-night

            -- You can configure highlights by doing something like
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('cyberdream').setup {
                -- Recommended - see "Configuring" below for more config options
                -- Enable transparent background
                transparent = true, -- Default: false

                -- Enable italics comments
                italic_comments = true, -- Default: false

                -- Replace all fillchars with ' ' for the ultimate clean look
                -- hide_fillchars = true, -- Default: false

                -- Modern borderless telescope theme
                -- borderless_telescope = false, -- Default: true

                -- Set terminal colors used in `:terminal`
                -- terminal_colors = false, -- Default: true
            }
        end,
    },

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
