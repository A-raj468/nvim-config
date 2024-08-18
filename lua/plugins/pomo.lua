return {
    {
        -- Pomodoro timer
        'epwalsh/pomo.nvim',
        version = '*',
        lazy = true,
        cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
        dependencies = {
            'rcarriga/nvim-notify',
        },
        opts = {
            sessions = {
                pomodoro = {
                    { name = 'Work', duration = '25m' },
                    { name = 'Short Break', duration = '5m' },
                    { name = 'Work', duration = '25m' },
                    { name = 'Short Break', duration = '5m' },
                    { name = 'Work', duration = '25m' },
                    { name = 'Long Break', duration = '15m' },
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
