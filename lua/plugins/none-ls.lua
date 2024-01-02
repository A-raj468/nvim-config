return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("plugins.configs.none-ls")
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("plugins.configs.mason-null-ls") -- require your null-ls config here (example below)
		end,
	},
}
