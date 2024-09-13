return {
    {
        -- Pomodoro timer
        'A-raj468/pomo.nvim',
        branch = 'fix-issue-31',
        lazy = true,
        cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
        dependencies = {
            'rcarriga/nvim-notify',
        },
        opts = {
            sessions = {
                pomodoro = {
                    { name = 'Work', duration = '1500s' },
                    { name = 'Short Break', duration = '300s' },
                    { name = 'Work', duration = '1500s' },
                    { name = 'Short Break', duration = '300s' },
                    { name = 'Work', duration = '1500s' },
                    { name = 'Long Break', duration = '900s' },
                },
            },
        },
        init = function()
            vim.keymap.set('n', '<leader>tb', ':TimerStart ', { desc = 'Pomo: [T]imer [B]egin' })
            vim.keymap.set('n', '<leader>te', ':TimerStop ', { desc = 'Pomo: [T]imer [E]nd' })
            vim.keymap.set('n', '<leader>ts', ':TimerSession ', { desc = 'Pomo: [T]imer [S]ession' })
        end,
    },
}
