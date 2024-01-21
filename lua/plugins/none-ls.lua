return {
    "nvimtools/none-ls.nvim",
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local null_ls = require "null-ls"
        local b = null_ls.builtins

        null_ls.setup {
            sources = {
                b.formatting.stylua,
                b.formatting.clang_format,
                b.formatting.black,
                b.formatting.isort,
            },
            on_attach = function(client, bufnr)
                if client.supports_method "textDocument/formatting" then
                    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format { async = false }
                        end,
                    })
                end
            end,
            vim.keymap.set("n", "<leader>fm", function()
                vim.lsp.buf.format { async = false }
            end, { desc = "Format buffer" }),
        }
    end,
}
