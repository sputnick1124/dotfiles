return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'rust-analyzer',
                'pylsp',
                'clangd',
            },
        },
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = true,
        dependencies = {
            'neovim/nvim-lspconfig',
        },
    },
}
