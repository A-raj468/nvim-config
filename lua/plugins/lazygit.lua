return {
    {
        -- LazyGit client inside neovim
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        keys = {
            { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy[G]it in a floating window' },
        },
    },
}
