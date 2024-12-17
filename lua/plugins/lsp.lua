return {
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'j-hui/fidget.nvim',
            'smjonas/inc-rename.nvim',
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'Hover Documentation' })
                    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = event.buf, desc = '[G]oto [D]efinition' })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = '[G]oto [D]eclaration' })
                    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { buffer = event.buf, desc = '[G]oto [I]mplementation' })
                    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = '[G]oto [R]eferences' })
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = event.buf, desc = 'LSP: Signature Help' })
                    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { buffer = event.buf, desc = 'Type [D]efinition' })
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode [A]ction' })
                    vim.keymap.set('n', '<leader>rn', function()
                        return ':IncRename ' .. vim.fn.expand '<cword>'
                    end, { buffer = event.buf, expr = true, desc = 'LSP: inc [R]e[n]ame' })

                    -- Highlights the word under the cursor references
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            local servers = {
                clangd = {},

                gopls = {
                    cmd = { 'gopls' },
                    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            usePlaceholders = true,
                            analyses = {
                                unusedparams = true,
                            },
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },

                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    '${3rd}/luv/library',
                                    unpack(vim.api.nvim_get_runtime_file('', true)),
                                },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                },

                pyright = {},

                rust_analyzer = {},

                typos_lsp = {
                    cmd_env = { RUST_LOG = 'error' },
                    init_options = {
                        diagnosticSeverity = 'Hint',
                    },
                },
            }

            require('mason').setup()

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua',
                'clang-format',
                'isort',
                'black',
                'prettierd',
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }
            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
            require('inc_rename').setup {}
            require('fidget').setup {}
        end,
    },
}
