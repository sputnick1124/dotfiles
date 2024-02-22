return {
    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        opts = {
            mappings = {
                extended = true,
            },
            ignore = '^$',
        },
        config = function(opts)
            require('Comment').setup(opts)
            local api = require('Comment.api')
            -- yank line before commenting
            vim.keymap.set('n', 'gcy', function()
                vim.cmd('norm! yy')
                api.toggle.linewise.current()
            end)
            -- yank range before commenting
            vim.keymap.set('x', 'gy', function()
                vim.cmd('norm! y')
                api.toggle.linewise(vim.fn.visualmode())
            end)
        end,
    },
    -- auto-detect tabs, spaces, indents, etc.
    'tpope/vim-sleuth',
    -- Manipulations for surrounding delimiters
    'tpope/vim-surround',
    -- Enable repeating operator ('.') for more actions
    'tpope/vim-repeat',
    -- git commands directly from nvim
    'tpope/vim-fugitive',
    -- aligning utilities
    'godlygeek/tabular',
    -- kill buffer, but keep window open
    'qpkorr/vim-bufkill',
    -- completion with LSP
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
    -- open file with cursor restored to last position
    'farmergreg/vim-lastplace',
    -- web api to make rust play work
    'mattn/webapi-vim',
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "idl",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
