return {
    -- {
    --     -- Pomodoro timer
    --     'epwalsh/pomo.nvim',
    --     version = '*',
    --     lazy = true,
    --     cmd = { 'TimerStart', 'TimerRepeat', 'TimerSession' },
    --     dependencies = {
    --         'rcarriga/nvim-notify',
    --     },
    --     opts = {
    --         sessions = {
    --             pomodoro = {
    --                 { name = 'Work', duration = '1500s' },
    --                 { name = 'Short Break', duration = '300s' },
    --                 { name = 'Work', duration = '1500s' },
    --                 { name = 'Short Break', duration = '300s' },
    --                 { name = 'Work', duration = '1500s' },
    --                 { name = 'Long Break', duration = '900s' },
    --             },
    --         },
    --     },
    --     init = function()
    --         vim.keymap.set('n', '<leader>tb', ':TimerStart ', { desc = 'Pomo: [T]imer [B]egin' })
    --         vim.keymap.set('n', '<leader>te', ':TimerStop ', { desc = 'Pomo: [T]imer [E]nd' })
    --         vim.keymap.set('n', '<leader>ts', ':TimerSession ', { desc = 'Pomo: [T]imer [S]ession' })
    --     end,
    -- },
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
            -- vim.keymap.set('n', '<leader>tb', '<CMD>PomodoroStart<CR>', { desc = 'Pomodoro: [T]imer [B]egin' })
            -- vim.keymap.set('n', '<leader>te', '<CMD>PomodoroStop<CR>', { desc = 'Pomodoro: [T]imer [E]nd' })
        end,
    },
}
