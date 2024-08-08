return {
    -- markdown rendering in neovim
    {
        'MeanderingProgrammer/markdown.nvim',
        name = 'render-markdown',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
        config = function()
            require('render-markdown').setup {}
        end,
    },
}
