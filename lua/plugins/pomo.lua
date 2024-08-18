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
        opts = {},
    },
}
