return {
    -- Lua
    {
        'folke/zen-mode.nvim',
        opts = {},
        init = function()
            vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', { desc = 'Toggle [Z]en[M]ode' })
        end,
    },
}
