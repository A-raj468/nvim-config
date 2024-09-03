return {
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('refactoring').setup()

            -- Extract function supports only visual mode
            vim.keymap.set('x', '<leader>re', function()
                require('refactoring').refactor 'Extract Function'
            end, { desc = '[R]efactor: [E]xtract function' })

            vim.keymap.set('x', '<leader>rf', function()
                require('refactoring').refactor 'Extract Function To File'
            end, { desc = '[R]efactor: extract function to a [F]ile' })

            -- Extract variable supports only visual mode
            vim.keymap.set('x', '<leader>rv', function()
                require('refactoring').refactor 'Extract Variable'
            end, { desc = '[R]efactor: extract [V]arible' })

            -- Inline func supports only normal
            vim.keymap.set('n', '<leader>rif', function()
                require('refactoring').refactor 'Inline Function'
            end, { desc = '[R]efactor: [I]nline [F]unction' })

            -- Inline var supports both normal and visual mode
            vim.keymap.set({ 'n', 'x' }, '<leader>riv', function()
                require('refactoring').refactor 'Inline Variable'
            end, { desc = '[R]efactor: [I]nline [V]ariable' })

            -- Extract block supports only normal mode
            vim.keymap.set('n', '<leader>rbe', function()
                require('refactoring').refactor 'Extract Block'
            end, { desc = '[R]efactor: [B]lock [E]xtract' })

            vim.keymap.set('n', '<leader>rbf', function()
                require('refactoring').refactor 'Extract Block To File'
            end, { desc = '[R]efactor: [B]lock extract to [F]ile' })
        end,
    },
}
