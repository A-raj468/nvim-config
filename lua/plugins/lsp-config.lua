return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- lua stuff
					"lua_ls",

					-- python stuff
					"pyright",

					-- cpp stuff
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp-config")
		end,
	},
}
