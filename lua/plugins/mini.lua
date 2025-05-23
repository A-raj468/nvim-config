return {
    {
        -- Beaitiful icons
        'echasnovski/mini.icons',
        version = '*',
        opts = {},
    },

    {
        -- Inhances commenting
        'echasnovski/mini.comment',
        version = '*',
        opts = {},
    },

    {
        -- Smart keymaps
        'echasnovski/mini.keymap',
        version = false,
        init = function()
            local keymap = require 'mini.keymap'
            local map_combo = keymap.map_combo

            -- Support most common modes. This can also contain 't', but would
            -- only mean to press `<Esc>` inside terminal.
            local mode = { 'i', 'c', 'x', 's' }
            map_combo(mode, 'jk', '<BS><BS><Esc>')

            -- To not have to worry about the order of keys, also map "kj"
            map_combo(mode, 'kj', '<BS><BS><Esc>')

            -- Escape into Normal mode from Terminal mode
            map_combo('t', 'jk', '<BS><BS><C-\\><C-n>')
            map_combo('t', 'kj', '<BS><BS><C-\\><C-n>')
        end,
    },

    {
        -- Inhanced textobjects for a/i motions
        'echasnovski/mini.ai',
        version = '*',
        opts = {
            n_lines = 500,
        },
    },

    {
        -- Indentline for scope
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            local indentscope = require 'mini.indentscope'
            indentscope.setup {
                draw = {
                    animation = indentscope.gen_animation.none(),
                },
                symbol = '│',
            }
        end,
    },

    {
        -- Highlights certain patterns
        'echasnovski/mini.hipatterns',
        version = '*',
        config = function()
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
