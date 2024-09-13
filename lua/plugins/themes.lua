return {
    -- Themes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        init = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
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
}
