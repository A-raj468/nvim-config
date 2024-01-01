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
vim.keymap.set("i", "<", "<><Left>", {})
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

-- keybindings for terminal
vim.cmd("set shell=powershell.exe")
vim.keymap.set("n", "<A-h>", ":sp<bar>term<CR><C-w>J:resize12<CR>i", {})
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", {})
