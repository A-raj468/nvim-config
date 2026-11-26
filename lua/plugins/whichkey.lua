return {
    ['which-key'] = {
        -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        args = {
            spec = {
                { '<leader>f', group = '[f]ind' },
                { '<leader>g', group = '[g]it' },
                { '<leader>gp', group = '[g]it: [p]review' },
                { '<leader>gq', group = '[g]it: [q]uickfix' },
                { '<leader>gr', group = '[g]it: [r]eset' },
                { '<leader>gs', group = '[g]it: [s]tage' },
                { '<leader>p', group = '[p]icture' },
                { '<leader>t', group = '[t]oggle' },
            },
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show { global = false }
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
}
