return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		-- return require "plugins.configs.nvchad-nvimtree"
		return require "plugins.configs.nvimtree"
	end,
	config = function(_, opts)
      	require("nvim-tree").setup(opts)
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
	end,
}
