return {
    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({})
        end,
    },

    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
        'folke/tokyonight.nvim',
        priority = 1000, -- make sure to load this before all the other start plugins
        init = function()
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            vim.cmd.colorscheme 'tokyonight-night'

            -- You can configure highlights by doing something like
            vim.cmd.hi 'Comment gui=italic'
        end,
    },

    -- {
    --     'scottmckendry/cyberdream.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('cyberdream').setup {
    --             -- Recommended - see "Configuring" below for more config options
    --             transparent = true,
    --             italic_comments = true,
    --             hide_fillchars = true,
    --             borderless_telescope = true,
    --             terminal_colors = true,
    --         }
    --         vim.cmd.colorscheme 'cyberdream' -- set the colorscheme
    --     end,
    -- },

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}