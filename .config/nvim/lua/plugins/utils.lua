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
        -- ripped directly from jonhoo/configs, will customize when I have the time
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            'neovim/nvim-lspconfig',
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                    -- REQUIRED by nvim-cmp. get rid of it once we can
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Accept currently selected item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                }, {
                    { name = 'path' },
                }),
                experimental = {
                    ghost_text = true,
                },
            })

            -- Enable completing paths in :
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                })
            })
        end
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
