-- Basic vim configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

-- keybindings for brackets and inverted commas completion
vim.keymap.set("i", "[", "[]<Left>", {})
vim.keymap.set("i", "{", "{}<Left>", {})
vim.keymap.set("i", "(", "()<Left>", {})
vim.keymap.set("i", "'", "''<Left>", {})
vim.keymap.set("i", '"', '""<Left>', {})

-- keybindings for window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Window Left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Window Right" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Window Up" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Window Down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up" })

-- keybindings for general uses
vim.keymap.set("n", ";", ":", { desc = "Open Command mode" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<C-w>", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-q>", ":qa<CR>", { desc = "Quit neovim" })
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>", { desc = "Save file" })

-- shell configurations
vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
vim.cmd(
	"let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'"
)
vim.cmd("let &shellredir = '2>&1 | %%{ \"$_\" } | Out-File %s; exit $LastExitCode'")
vim.cmd("let &shellpipe  = '2>&1 | %%{ \"$_\" } | Tee-Object %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")
vim.keymap.set("n", "<A-h>", ":ToggleTerm direction=horizontal size=12<CR>", { desc = "Toggle horizontal terminal" })
vim.keymap.set("n", "<A-v>", ":ToggleTerm direction=vertical size=80<CR>", { desc = "Toggle vertical terminal" })
vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Escape terminal mode" })
