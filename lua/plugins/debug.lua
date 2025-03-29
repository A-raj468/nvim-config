return {
    {
        -- Nvim dap for debugging
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',

            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',

            'leoluz/nvim-dap-go',
            'mfussenegger/nvim-dap-python',
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'

            require('mason-nvim-dap').setup {
                automatic_setup = true,
                ensure_installed = {
                    'delve',
                    'cpptools',
                },
                handlers = {},
            }

            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = vim.fn.stdpath 'data' .. '/mason/bin/OpenDebugAD7',
            }

            -- Basic debugging keymaps, feel free to change to your liking!
            vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
            vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
            vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
            vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
            vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
            vim.keymap.set('n', '<leader>B', function()
                dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end, { desc = 'Debug: Set Breakpoint' })

            dapui.setup {}

            vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

            dap.listeners.after.event_initialized['dapui_config'] = dapui.open
            dap.listeners.before.event_terminated['dapui_config'] = dapui.close
            dap.listeners.before.event_exited['dapui_config'] = dapui.close

            require('dap-go').setup()
            require('dap-python').setup '/home/maxi/.config/nvim/.virtualenvs/debugpy/bin/python'
        end,
    },
}
