return {
    {
        -- LazyGit client inside neovim
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open [L]azy[G]it in a floating window' },
        },
    },
}
