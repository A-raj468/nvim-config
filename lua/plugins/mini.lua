return {
    ['mini.nvim'] = {
        -- [[ mini.nvim ]]
        --  A collection of various small independent plugins/modules
        'nvim-mini/mini.nvim',
        after = function()
            -- If a nerd font is available, load the icons module for pretty icons in various plugins.
            if vim.g.have_nerd_font then
                require('mini.icons').setup()
                -- Used for backwards compatibility with plugins that require `nvim-web-devicons` (e.g. telescope.nvim)
                MiniIcons.mock_nvim_web_devicons()
            end

            -- Better Around/Inside textobjects
            require('mini.ai').setup {
                -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
                mappings = {
                    around_next = 'aa',
                    inside_next = 'ii',
                },
                n_lines = 500,
            }

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            require('mini.surround').setup()

            -- Simple and easy statusline.
            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = vim.g.have_nerd_font }
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end

            -- Smart keymaps
            local keymap = require 'mini.keymap'
            local map_combo = keymap.map_combo

            local mode = { 'i', 'c', 'x', 's' }
            map_combo(mode, 'jk', '<BS><BS><Esc>')
            map_combo(mode, 'kj', '<BS><BS><Esc>')

            -- Escape into Normal mode from Terminal mode
            map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
            map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')

            local indentscope = require 'mini.indentscope'
            indentscope.setup {
                draw = {
                    animation = indentscope.gen_animation.none(),
                },
                symbol = '│',
            }

            local hipatterns = require 'mini.hipatterns'
            hipatterns.setup {
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            }
        end,
    },
}
