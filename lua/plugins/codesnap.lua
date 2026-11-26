return {
    codesnap = {
        -- Create beautiful code screenshots
        'mistricky/codesnap.nvim',
        version = 'v2.0.5',
        keys = {
            { '<leader>pc', ':CodeSnap<cr>', mode = 'x', desc = '[p]icture: [c]opy code snapshot' },
            { '<leader>pa', ':CodeSnapASCII<cr>', mode = 'x', desc = '[p]icture: copy code [a]SCII snapshot' },
            { '<leader>ps', ':CodeSnapSave ', mode = 'x', desc = '[p]icture: [s]ave code snapshot' },
        },
        args = {
            save_path = '~/Pictures',
            has_breadcrumbs = true,
            breadcrumbs_separator = ' ❯ ',
            has_line_number = true,
            bg_theme = 'default',
            watermark = '',
        },
    },
}
