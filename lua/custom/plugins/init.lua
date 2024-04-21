-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    -- codium
    {
        'Exafunction/codeium.vim',
        config = function()
            vim.g.codeium_disable_bindings = 1
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function()
                return vim.fn['codeium#Accept']()
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-r>', function()
                return vim.fn['codeium#CycleCompletions'](1)
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-t>', function()
                return vim.fn['codeium#CycleCompletions'](-1)
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-x>', function()
                return vim.fn['codeium#Clear']()
            end, { expr = true, silent = true })
        end,
        event = 'BufEnter',
    },
    -- vim be good
    {
        'ThePrimeagen/vim-be-good',
        lazy = false,
    },
    -- headlines for markdown
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true, -- or `opts = {}`
    },
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
