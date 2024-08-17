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
        priority = 1000,
        init = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'eldritch-theme/eldritch.nvim',
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'scottmckendry/cyberdream.nvim',
        priority = 1000,
        opts = {
            transparent = false,
            italic_comments = true,
        },
    },

    {
        'rebelot/kanagawa.nvim',
        priority = 1000,
        init = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            signs = true,
        },
    },
}
