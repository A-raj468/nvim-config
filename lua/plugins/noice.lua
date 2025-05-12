return {
    {
        -- Nice UI elements for messages, cmdline and popupmenu
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        event = 'VeryLazy',
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },
            },
            presets = { inc_rename = true },
        },
        keys = {
            {
                '<leader>dn',
                function()
                    require('notify').dismiss { silent = true, pending = true }
                end,
                desc = '[D]ismiss All [N]otifications',
            },
        },
    },
}
