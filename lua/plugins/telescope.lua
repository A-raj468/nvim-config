return {
    {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
            { 'andrew-george/telescope-themes' },
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                    themes = {
                        enable_live_preview = true,
                        persist = {
                            enabled = true,

                            path = vim.fn.stdpath 'config' .. '/lua/core/current-theme.lua',
                        },
                    },
                },
            }

            require('telescope').load_extension 'fzf'
            require('telescope').load_extension 'ui-select'

            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[Find] [K]eymaps' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
            vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[Find] [S]elect Telescope' })

            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[Find] [R]esume' })
            vim.keymap.set('n', '<leader>ft', ':Telescope themes<CR>', { silent = true, desc = '[Find] [T]heme' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[Find] [D]iagnostics' })

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[Find] [F]iles' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find()
            end, { desc = '[/] Fuzzily find in current buffer' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[Find] [G]lobally' })
            vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[Find] [C]urrent word' })
        end,
    },
}
