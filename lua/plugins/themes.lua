return {
    -- Themes
    catppuccin = {
        'catppuccin/nvim',
        after = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },
    ['rose-pine'] = {
        'rose-pine/neovim',
        after = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },
    tokyonight = {
        'folke/tokyonight.nvim',
        after = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },
    eldritch = {
        'eldritch-theme/eldritch.nvim',
        args = {},
        after = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },
    cyberdream = {
        'scottmckendry/cyberdream.nvim',
        args = {
            transparent = false,
            italic_comments = true,
        },
    },
    kanagawa = {
        'rebelot/kanagawa.nvim',
        after = function()
            vim.cmd.hi 'Comment gui=italic'
        end,
    },
}
