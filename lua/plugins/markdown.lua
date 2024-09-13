return {
    {
        -- Markdown renderer
        'OXY2DEV/markview.nvim',
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            modes = { 'n', 'no', 'c' },
            hybrid_modes = { 'n' },
            -- This is nice to have
            callbacks = {
                on_enable = function(_, win)
                    vim.wo[win].conceallevel = 2
                    vim.wo[win].concealcursor = 'nc'
                end,
            },
        },
    },
}
