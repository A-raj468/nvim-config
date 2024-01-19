return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        -- return require "plugins.configs.nvchad-nvimtree"
        return require("plugins.configs.nvimtree")
    end,
    config = function(_, opts)
        require("nvim-tree").setup(opts)
        require("nvim-web-devicons").set_icon({
            cu = {
                icon = "Cu",
                color = "#8dc149",
                cterm_color = "65",
                name = "Zsh",
            },
        })
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
    end,
}
