return {
    notify = {
        'rcarriga/nvim-notify',
    },
    pomo = {
        -- Pomodoro timer
        'A-raj468/pomo.nvim',
        args = {
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
