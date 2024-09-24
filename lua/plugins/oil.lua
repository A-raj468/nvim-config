return {
    {
        'stevearc/oil.nvim',
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        opts = {
            columns = {
                'icon',
            },
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ['gd'] = {
                    desc = 'Toggle file detail view',
                    callback = function()
                        detail = not detail
                        if detail then
                            require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
                        else
                            require('oil').set_columns { 'icon' }
                        end
                    end,
                },
            },
        },
        init = function()
            vim.keymap.set('n', '<leader>o', require('oil').open, { desc = 'Open oil' })
        end,
    },
}
