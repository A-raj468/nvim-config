return {
    gitsigns = {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        args = {
            signs = {
                add = { text = '+' }, ---@diagnostic disable-line: missing-fields
                change = { text = '~' }, ---@diagnostic disable-line: missing-fields
                delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
                topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
                changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
            },

            -- gitsigns.nvim's recommended keymaps:
            on_attach = function(bufnr)
                -- Navigation
                local gitsigns = require 'gitsigns'
                vim.keymap.set('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gitsigns.nav_hunk 'next'
                    end
                end, { desc = 'Jump to next git [c]hange', buf = bufnr })

                vim.keymap.set('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gitsigns.nav_hunk 'prev'
                    end
                end, { desc = 'Jump to previous git [c]hange', buf = bufnr })

                -- Visual mode actions
                vim.keymap.set('v', '<leader>gsh', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = '[g]it: [s]tage [h]unk', buf = bufnr })
                vim.keymap.set('n', '<leader>gsh', gitsigns.stage_hunk, { desc = '[g]it: [s]tage [h]unk', buf = bufnr })
                vim.keymap.set('n', '<leader>gsb', gitsigns.stage_buffer, { desc = '[g]it: [s]tage [b]uffer', buf = bufnr })

                vim.keymap.set('v', '<leader>grh', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = '[g]it: [r]eset [h]unk', buf = bufnr })
                -- Normal mode actions
                vim.keymap.set('n', '<leader>grh', gitsigns.reset_hunk, { desc = '[g]it: [r]eset [h]unk', buf = bufnr })
                vim.keymap.set('n', '<leader>grb', gitsigns.reset_buffer, { desc = '[g]it: [r]eset [b]uffer', buf = bufnr })

                vim.keymap.set('n', '<leader>gb', function()
                    gitsigns.blame_line { full = true }
                end, { desc = '[g]it [b]lame line', buf = bufnr })

                vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = '[g]it [d]iff against index', buf = bufnr })
                vim.keymap.set('n', '<leader>gD', function()
                    gitsigns.diffthis '~1'
                end, { desc = '[g]it [D]iff against last commit', buf = bufnr })

                vim.keymap.set('n', '<leader>gph', gitsigns.preview_hunk, { desc = '[g]it [p]review [h]unk', buf = bufnr })
                vim.keymap.set('n', '<leader>gpi', gitsigns.preview_hunk_inline, { desc = '[g]it [p]review hunk [i]nline', buf = bufnr })

                vim.keymap.set('n', '<leader>gqb', gitsigns.setqflist, { desc = '[g]it [q]uickfix ([b]uffer)', buf = bufnr })
                vim.keymap.set('n', '<leader>gqa', function()
                    gitsigns.setqflist 'all'
                end, { desc = '[g]it [q]uickfix ([a]ll)', buf = bufnr })

                -- Toggles
                vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line', buf = bufnr })
                vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff', buf = bufnr })

                -- Text object
                vim.keymap.set({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'text object [i]nside [h]unk', buf = bufnr })
            end,
        },
    },
}
