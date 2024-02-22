local telescope_setup = function(_, _)
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('dap')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('ui-select')
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
    vim.keymap.set('n', '<leader>sf', function()
        require('telescope.builtin').find_files { previewer = false }
    end)
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
    vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').tags)
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_status)
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
    vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', require('telescope').extensions.file_browser.file_browser)
end

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-dap.nvim',
        },
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        },
        config = telescope_setup,
    },    
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
    },
}
