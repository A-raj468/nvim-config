return {
    undotree = {
        -- Visualizes the undo history
        'mbbill/undotree',
        after = function()
            vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = '[t]oggle [u]ndo tree' })
        end,
    },
}
