return {
    ['zen-mode'] = {
        -- Zen mode
        'folke/zen-mode.nvim',
        args = {},
        after = function()
            vim.keymap.set('n', '<leader>tz', require('zen-mode').toggle, { desc = '[T]oggle [Z]en Mode' })
        end,
    },
}
