return {
    plenary = { 'nvim-lua/plenary.nvim' },
    ['mini.nvim'] = { 'nvim-mini/mini.nvim' },
    ['telescope-ui-select'] = { 'nvim-telescope/telescope-ui-select.nvim' },
    ['telescope-fzf-native'] = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = function()
            if vim.fn.executable 'make' ~= 1 then
                return
            end
            return { 'make' }
        end,
    },
    ['telescope-themes'] = { 'andrew-george/telescope-themes' },
    telescope = {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        after = function()
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                    themes = {
                        persist = {
                            enabled = true,
                            path = vim.fn.stdpath 'config' .. '/lua/core/current-theme.lua',
                        },
                        mappings = {
                            down = '<C-n>',
                            up = '<C-p>',
                            accept = '<C-y>',
                        },
                    },
                },
            }

            require('telescope').load_extension 'fzf'
            require('telescope').load_extension 'ui-select'
            require('telescope').load_extension 'themes'

            local builtin = require 'telescope.builtin'

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })

            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find()
            end, { desc = '[/] Fuzzily find in current buffer' })
            vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = '[f]ind [c]urrent word' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind [g]lobally' })

            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[f]ind [b]uffers' })

            vim.keymap.set('n', '<leader>ft', ':Telescope themes<CR>', { noremap = true, silent = true, desc = '[f]ind [t]heme' })

            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[find] [r]esume' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind [d]iagnostics' })

            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[f]ind [k]eymaps' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [h]elp' })
            vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[f]ind [s]elect telescope' })
        end,
    },
}
