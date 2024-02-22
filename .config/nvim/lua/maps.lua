-- Better split navigation
local opts = { noremap = true, silent = true }
--Normal mode
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
--Leave insert mode and move immediately
vim.api.nvim_set_keymap('i', '<C-h>', '<Esc><C-w>h', opts)
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc><C-w>j', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc><C-w>k', opts)
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc><C-w>l', opts)
--Leave terminal mode and move immediately
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
--Also allow regular <Esc> to break into normal mode in terminal
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', opts)
--But also provide map to send <Esc> to terminal if needed
vim.api.nvim_set_keymap('t', '<A-[>', '<Esc>', opts)

--Neat line-moving actions with Alt
vim.api.nvim_set_keymap('n', '<S-A-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-A-k>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-A-j>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', '<S-A-k>', ":m '<-2<CR>gv=gv", { noremap = true })

-- Center search results on screen
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '*', '*zz', opts)
vim.keymap.set('n', '#', '#zz', opts)
--stop searching
vim.keymap.set({ 'n', 'v' }, '<C-q>', ':nohlsearch<CR>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist({ workspace = true }) end)

