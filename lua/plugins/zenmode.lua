return {
    -- Lua
    {
        'folke/zen-mode.nvim',
        opts = {},
        init = function()
            vim.keymap.set('n', '<leader>zm', require('zen-mode').toggle, { desc = 'Toggle [Z]en[M]ode' })
        end,
    },
}
