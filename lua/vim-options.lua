vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

vim.o.nu = true
vim.o.relativenumber = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- shell configurations
vim.cmd "let &shell = executable('pwsh') ? 'pwsh' : 'powershell'"
vim.cmd "let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'"
vim.cmd "let &shellredir = '2>&1 | %%{ \"$_\" } | Out-File %s; exit $LastExitCode'"
vim.cmd "let &shellpipe  = '2>&1 | %%{ \"$_\" } | Tee-Object %s; exit $LastExitCode'"
vim.cmd "set shellquote= shellxquote="
