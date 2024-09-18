return {
    {
        -- Pomodoro timer
        'A-raj468/pomo.nvim',
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
    },
}
