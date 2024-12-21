local enabled = false
-- enabled = true

if not enabled then
    return {}
end

return {
    {
        -- AI completion
        'Exafunction/codeium.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
        },
        opts = {
            enable_chat = true,
        },
    },
}
