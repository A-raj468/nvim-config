vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlight' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- My custom keymaps
vim.keymap.set('n', '<C-s>', '<CMD> w <CR>', { desc = 'save file' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Moves half page Down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Moves half page Up' })
vim.keymap.set('n', '<n>', 'nzzzv', { desc = '' })
vim.keymap.set('n', '<N>', 'Nzzzv', { desc = '' })
vim.keymap.set('n', '<M-k>', '<CMD>m -2<CR>==', { desc = 'Move selected block Up' })
vim.keymap.set('n', '<M-j>', '<CMD>m +1<CR>==', { desc = 'Move selected block Down' })

vim.keymap.set('v', '>', '>gv', { desc = 'indent' })
vim.keymap.set('v', '<', '<gv', { desc = 'indent' })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected block Up' })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected block Down' })

vim.keymap.set('i', '<C-s>', '<ESC><CMD> w <CR>', { desc = 'save file' })
vim.keymap.set('i', '<M-k>', '<CMD>m -2<CR><C-o>==', { desc = 'Move selected block Up' })
vim.keymap.set('i', '<M-j>', '<CMD>m +1<CR><C-o>==', { desc = 'Move selected block Down' })
