return {
    {
        -- Pomodoro timer
        'wthollingsworth/pomodoro.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('pomodoro').setup {
                time_work = 25,
                time_break_short = 5,
                time_break_long = 20,
                timers_to_long_break = 4,
            }
            vim.keymap.set('n', '<leader>tb', '<CMD>PomodoroStart<CR>', { desc = 'Pomodoro: [T]imer [B]egin' })
            vim.keymap.set('n', '<leader>te', '<CMD>PomodoroStop<CR>', { desc = 'Pomodoro: [T]imer [E]nd' })
        end,
    },
}
