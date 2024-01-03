-- Basic vim configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.g.mapleader = " "

-- keybindings for brackets and inverted commas completion
vim.keymap.set("i", "[", "[]<Left>", {})
vim.keymap.set("i", "{", "{}<Left>", {})
vim.keymap.set("i", "(", "()<Left>", {})
vim.keymap.set("i", "'", "''<Left>", {})
vim.keymap.set("i", '"', '""<Left>', {})

-- keybindings for window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {})

-- keybindings for general uses
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", "<C-s>", ":w<CR>", {})
vim.keymap.set("n", "<C-w>", ":bd<CR>", {})
vim.keymap.set("n", "<C-q>", ":qa<CR>", {})

-- shell configurations
vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
vim.cmd("let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'")
vim.cmd("let &shellredir = '2>&1 | %%{ \"$_\" } | Out-File %s; exit $LastExitCode'")
vim.cmd("let &shellpipe  = '2>&1 | %%{ \"$_\" } | Tee-Object %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")
vim.keymap.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=12<CR>", {})
vim.keymap.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>", {})
vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float<CR>", {})
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", {})