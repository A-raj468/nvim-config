local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
})

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Got definition" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information" })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename under cursor" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename under cursor" })
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Open code action" })
