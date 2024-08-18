return {
    {
        -- Suggests key hints
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            spec = {
                { '<leader>c', group = '[C]ode' },
                { '<leader>d', group = '[D]ocument' },
                { '<leader>r', group = '[R]ename' },
                { '<leader>s', group = '[S]earch' },
                { '<leader>w', group = '[W]orkspace' },
                { '<leader>t', group = '[T]oggle' },
                {
                    mode = { 'n', 'v' },
                    { '<leader>h', group = 'Git [H]unk' },
                },
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
