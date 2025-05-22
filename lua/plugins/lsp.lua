return {
    {
        -- LSP Setup
        'williamboman/mason.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'j-hui/fidget.nvim',
            'smjonas/inc-rename.nvim',
            'saghen/blink.cmp',
        },
        config = function()
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

            -- Diagnostic Config
            -- See :help vim.diagnostic.Opts
            vim.diagnostic.config {
                severity_sort = true,
                float = { border = 'rounded', source = 'if_many' },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                    },
                } or {},
                virtual_text = {
                    source = 'if_many',
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            }

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local servers = {
                ['clangd'] = require 'lsp-config.clangd',
                ['cmake-language-server'] = require 'lsp-config.cmake_ls',
                ['gopls'] = require 'lsp-config.gopls',
                ['lua-language-server'] = require 'lsp-config.lua_ls',
                ['pyright'] = require 'lsp-config.pyright',
                ['typos-lsp'] = require 'lsp-config.typos_lsp',
            }
            require('mason').setup {}

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                -- formatters
                'stylua',
                'cmakelang',
                'clang-format',
                'isort',
                'black',
                'prettierd',
                'shfmt',

                -- debuggers
                'delve',
                'cpptools',
            })

            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            local enable = function(server_name)
                local server = servers[server_name] or {}
                server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                vim.lsp.config(server_name, server)
                vim.lsp.enable(server_name)
            end
            for server_name, server in pairs(servers) do
                enable(server_name)
            end

            require('inc_rename').setup {}
            require('fidget').setup {}
        end,
    },
}
