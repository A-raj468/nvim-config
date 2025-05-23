return {
    {
        -- Harpoon for better file navigations
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = function()
            local harpoon = require 'harpoon'
            vim.keymap.set('n', '<leader>ha', function()
                harpoon:list():add()
            end, { desc = '[H]arpoon: [A]dd item' })
            vim.keymap.set('n', '<leader>hl', function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = '[H]arpoon: [L]ist items' })
            vim.keymap.set('n', '<leader>1', function()
                harpoon:list():select(1)
            end, { desc = 'Harpoon: Select item [1]' })
            vim.keymap.set('n', '<leader>2', function()
                harpoon:list():select(2)
            end, { desc = 'Harpoon: Select item [2]' })
            vim.keymap.set('n', '<leader>3', function()
                harpoon:list():select(3)
            end, { desc = 'Harpoon: Select item [3]' })
            vim.keymap.set('n', '<leader>4', function()
                harpoon:list():select(4)
            end, { desc = 'Harpoon: Select item [4]' })
            vim.keymap.set('n', '<leader>hp', function()
                harpoon:list():prev()
            end, { desc = '[H]arpoon: [P]revious item' })
            vim.keymap.set('n', '<leader>hn', function()
                harpoon:list():next()
            end, { desc = '[H]arpoon: [N]ext item' })
        end,
    },
}
