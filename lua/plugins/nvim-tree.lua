return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = function()
        return {
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
            end,
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            view = {
                adaptive_size = false,
                side = "left",
                width = 30,
                preserve_window_proportions = true,
            },
            git = {
                enable = true,
                ignore = false,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
            renderer = {
                root_folder_label = false,

                full_name = true,

                highlight_git = true,
                highlight_diagnostics = true,
                group_empty = true,
                highlight_opened_files = "icon",

                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },

                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            -- open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            -- unstaged = "✗",
                            -- staged = "✓",
                            -- unmerged = "",
                            -- renamed = "➜",
                            -- untracked = "★",
                            -- deleted = "",
                            -- ignored = "◌",
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        }
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
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree", silent=true })
    end,
}
