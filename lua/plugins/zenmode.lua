return {
    {
        -- Zen mode
        'folke/zen-mode.nvim',
        opts = {},
        init = function()
            vim.keymap.set('n', '<leader>tz', require('zen-mode').toggle, { desc = '[T]oggle [Z]en Mode' })
        end,
    },
}
