return {
    {
        -- Autoformat
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = true,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { 'stylua' },
                cpp = { 'clang-format' },
                python = { 'isort', 'black' },
                markdown = { 'prettierd' },
                javascript = { 'prettierd' },
                css = { 'prettierd' },
                html = { 'prettierd' },
                sh = { 'shfmt' },
            },
            formatters = {
                shfmt = {
                    command = 'shfmt',
                    prepend_args = { '-sr' },
                },
            },
        },
    },
}
