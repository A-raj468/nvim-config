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
        -- Surround capabilities
        'echasnovski/mini.surround',
        version = '*',
        opts = {
            mappings = {
                add = 'gsa', -- Add surrounding in Normal and Visual modes
                delete = 'gsd', -- Delete surrounding
                find = 'gsf', -- Find surrounding (to the right)
                find_left = 'gsF', -- Find surrounding (to the left)
                highlight = 'gsh', -- Highlight surrounding
                replace = 'gsr', -- Replace surrounding
                update_n_lines = 'gsn', -- Update `n_lines`
            },
        },
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
