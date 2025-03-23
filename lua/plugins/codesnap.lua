return {
    {
        -- Create beautiful code screenshots
        'mistricky/codesnap.nvim',
        build = 'make build_generator',
        keys = {
            { '<leader>pc', ':CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
            { '<leader>ps', ':CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
        },
        opts = {
            save_path = '~/Pictures',
            has_breadcrumbs = true,
            breadcrumbs_separator = ' ❯ ',
            has_line_number = true,
            bg_theme = 'default',
            watermark = '',
        },
    },
}
