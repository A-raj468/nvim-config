return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- keybindings
            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find file in open buffer" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help documentation" })
            vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find commands" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        },
                    },
                },
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension "ui-select"
        end,
    },
}
