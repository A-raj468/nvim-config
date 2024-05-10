return {
    -- NOTE: Plugins can also be added by using a table,
    -- with the first argument being the link and the following
    -- keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to force a plugin to be loaded.
    --
    --  This is equivalent to:
    --    require('Comment').setup({})

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- vim be good
    {
        'ThePrimeagen/vim-be-good',
        lazy = false,
    },

    -- nvim-tmux navigation
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            require('nvim-tmux-navigation').setup {
                -- disable_when_zoomed = true, -- defaults to false
                keybindings = {
                    left = '<C-h>',
                    down = '<C-j>',
                    up = '<C-k>',
                    right = '<C-l>',
                    last_active = '<C-\\>',
                    next = '<C-Space>',
                },
            }
        end,
    },
}
