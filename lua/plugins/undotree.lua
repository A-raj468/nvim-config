return {
    {
        -- Visualizes the undo history
        'mbbill/undotree',
        init = function()
            vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = '[T]oggle [U]ndo Tree' })
        end,
    },
}
