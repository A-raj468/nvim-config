return {
    {
        'stevearc/oil.nvim',
        opts = {
            skip_confirm_for_simple_edits = true,
        },
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        config = function(opts)
            require('oil').setup(opts)
            vim.keymap.set('n', '<leader>of', function()
                require('oil').open '.'
            end, { desc = 'Open [O]il [F]ile Browser' })
        end,
    },
}
