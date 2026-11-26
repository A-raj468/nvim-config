return {
    nui = {
        'MunifTanjim/nui.nvim',
    },
    notify = {
        -- Nice notification popups
        'rcarriga/nvim-notify',
        args = {
            stages = 'static',
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        },
    },
    inc_rename = {
        'smjonas/inc-rename.nvim',
    },
    noice = {
        -- Nice UI elements for messages, cmdline and popupmenu
        'folke/noice.nvim',
        args = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },
            },
            presets = { inc_rename = true },
        },
    },
}
