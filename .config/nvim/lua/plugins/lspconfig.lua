local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    local function lsp_list_handler(item_opts) 
        vim.fn.setloclist(0, {}, ' ', item_opts)
        vim.api.nvim_command('lopen')
    end
    local lspopts = { reuse_win = true, on_list = lsp_list_handler }
    -- Emulate cscope bindings to appease my muscle memory
    vim.keymap.set('n', 'gD', function()
        vim.lsp.buf.declaration(lspopts)
    end, opts)
    vim.keymap.set('n', '<leader>D', function()
        vim.lsp.buf.type_definition(lspopts)
    end, opts)
    vim.keymap.set('n', '<leader>g', function()
        vim.lsp.buf.definition(lspopts)
    end, opts)
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.incoming_calls, opts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.outgoing_calls, opts)
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>?', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
        vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_workspace_symbols, opts)
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format{ async = true }
    end, {})
end

local setup_servers = function(_, _)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require('lspconfig').clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        cmd = {
            "clangd",
            "--background-index",
            "--log=info",
            "--header-insertion=iwyu",
            "--pretty",
            "--clang-tidy",
            "--cross-file-rename",
        },
        filetype = { "cpp", "c" },
    }

    require('lspconfig').ruff_lsp.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }

    require('lspconfig').rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            ['rust-analyzer'] = {
                cargo = { allFeatures = true },
                checkOnSave = {
                    command = 'clippy',
                    extraArgs = { '--no-deps' },
                },
            }
        },
        filetype = {"rust", "rs" }
    }

    require('lspconfig').uiua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = true,
    }
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'telescope.nvim',
            'neovim/nvim-lspconfig',
        },
        config = setup_servers,
    },
}
