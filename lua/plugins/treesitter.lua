return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'cmake',
                'cpp',
                'go',
                'html',
                'lua',
                'markdown',
                'markdown_inline',
                'python',
                'vim',
                'vimdoc',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown' },
            },
            indent = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = 'n',
                    node_decremental = 'N',
                    scope_incremental = 'v',
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    {
        -- Shows context of the current cursor position
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        config = function(_, opts)
            require('treesitter-context').setup(opts)
            vim.keymap.set('n', '[c', function()
                require('treesitter-context').go_to_context(vim.v.count1)
            end, { silent = true })
        end,
    },
}
