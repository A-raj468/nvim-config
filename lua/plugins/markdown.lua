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
            preview = {
                enable = true,
                filetypes = { 'md', 'rmd', 'quarto' },
                ignore_buftypes = { 'nofile' },
                ignore_previews = {},

                modes = { 'n', 'no', 'c' },
                hybrid_modes = {},
                debounce = 50,
                draw_range = { vim.o.lines, vim.o.lines },
                edit_range = { 1, 0 },

                -- This is nice to have
                callbacks = {
                    on_enable = function(_, win)
                        vim.wo[win].conceallevel = 2
                        vim.wo[win].concealcursor = 'nc'
                    end,
                },

                splitview_winopts = { split = 'left' },
            },
        },
    },
}
