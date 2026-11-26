return {
    fidget = {
        'j-hui/fidget.nvim',
        args = {},
    },
    inc_rename = {
        'smjonas/inc-rename.nvim',
        args = {},
    },
    telescope = { 'nvim-telescope/telescope.nvim' },
    ['nvim-lspconfig'] = { 'neovim/nvim-lspconfig' },
    ['mason-lspconfig'] = { 'mason-org/mason-lspconfig.nvim' },
    ['mason-tool-installer'] = { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    mason = {
        -- LSP Setup
        'mason-org/mason.nvim',
        after = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                desc = 'LSP actions',
                callback = function(event)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: Hover Documentation' })
                    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = event.buf, desc = 'LSP: Goto Definition' })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = 'LSP: Goto Declaration' })
                    vim.keymap.set('n', 'gri', require('telescope.builtin').lsp_implementations, { buffer = event.buf, desc = 'LSP: Goto Implementation' })
                    vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = 'LSP: Goto References' })
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = event.buf, desc = 'LSP: Signature Help' })
                    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { buffer = event.buf, desc = 'LSP: Type Definition' })
                    vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Code Action' })
                    vim.keymap.set('n', 'grn', function()
                        return ':IncRename ' .. vim.fn.expand '<cword>'
                    end, { buffer = event.buf, expr = true, desc = 'LSP: Rename' })

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                        local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end,
            })

            local servers = {
                stylua = {},
                lua_ls = {
                    on_init = function(client)
                        client.server_capabilities.documentFormattingProvider = false

                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                                return
                            end
                        end

                        local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
                        client.config.settings.Lua = vim.tbl_deep_extend('force', current_settings.Lua, {
                            runtime = {
                                version = 'LuaJIT',
                                path = { 'lua/?.lua', 'lua/?/init.lua' },
                            },
                            workspace = {
                                checkThirdParty = false,
                                -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                                --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                                library = vim.api.nvim_get_runtime_file('', true),
                            },
                        })
                    end,
                    ---@type lspconfig.settings.lua_ls
                    settings = {
                        Lua = {
                            format = { enable = false },
                        },
                    },
                },
                clangd = {},
                cmake = {},
                ruff = {},
                typos_lsp = {},
                -- gopls = {},
            }
            require('mason').setup {}

            -- Translates between nvim-lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
            require('mason-lspconfig').setup {
                automatic_enable = false,
            }

            for name, server in pairs(servers) do
                vim.lsp.config(name, server)
                vim.lsp.enable(name)
            end
        end,
    },
}
