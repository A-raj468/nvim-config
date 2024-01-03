return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
    init = function()
        vim.keymap.set("n", "<A-t>", require("plugins.configs.toggleterm").init_or_toggle, {})
    end,
}
