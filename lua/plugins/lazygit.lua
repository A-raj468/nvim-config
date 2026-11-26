return {
    plenary = { 'nvim-lua/plenary.nvim' },
    lazygit = {
        -- LazyGit client inside neovim
        'kdheepak/lazygit.nvim',
        keys = {
            { '<leader>gl', '<cmd>LazyGit<cr>', desc = '[g]it: Open [l]azygit' },
        },
    },
}
