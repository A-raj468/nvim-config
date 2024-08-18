return {
    {
        -- Visualizes the undo history
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Toggle [U]ndo [T]ree' })
        end,
    },
}
