return {
    ['mini.nvim'] = { 'nvim-mini/mini.nvim' },
    oil = {
        -- File explorer
        'stevearc/oil.nvim',
        args = {
            columns = {
                'icon',
            },
            skip_confirm_for_simple_edits = true,
        },
        after = function()
            vim.keymap.set('n', '<leader>o', require('oil').open, { desc = 'Open [o]il' })
        end,
    },
}
