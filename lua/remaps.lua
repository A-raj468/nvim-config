function setkeymap(mappings)
    for mode, remaps in pairs(mappings) do
        for key, action in pairs(remaps) do
            action[3].desc = action[2]
            vim.keymap.set(mode, key, action[1], action[3])
        end
    end
end

mappings = {
    ["n"] = {
        -- navigational remaps
        ["<C-h>"] = { "<C-w><C-h>", "Window Left", {} },
        ["<C-l>"] = { "<C-w><C-l>", "Window Right", {} },
        ["<C-k>"] = { "<C-w><C-k>", "Window Up", {} },
        ["<C-j>"] = { "<C-w><C-j>", "Window Down", {} },
        ["<C-d>"] = { "<C-d>zz", "Page Down", {} },
        ["<C-u>"] = { "<C-u>zz", "Page Up", {} },
        ["<n>"] = { "<nzzzv", "", {} },
        ["<N>"] = { "Nzzzv", "", {} },

        -- command remaps
        [";"] = { ":", "Open Command mode", {} },
        ["<C-s>"] = { ":w<CR>", "Save file", {} },
        ["<leader>x"] = { ":bd<CR>", "Close buffer", {} },
        ["<C-q>"] = { ":qa<CR>", "Quit neovim", {} },
    },
    ["v"] = {
        -- command remaps
        [";"] = { ":", "Open command mode", {} },
        ["<Up>"] = { ":m '<-2<CR>gv=gv", "Move selected block Up", {} },
        ["<Down>"] = { ":m '>+1<CR>gv=gv", "Move selected block Down", {} },
    },
    ["i"] = {
        -- command remaps
        ["<C-s>"] = { "<ESC>:w<CR>", "Save file", {} },
    },
}

setkeymap(mappings)
