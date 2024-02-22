local config = function(_, opts)
    require('gitsigns').setup(opts)
    -- Operations on hunks --
    -- Stage and Reset
    vim.keymap.set({ 'n', 'v' }, '<leader>hs', require('gitsigns').stage_hunk)
    vim.keymap.set({ 'n', 'v' }, '<leader>hr', require('gitsigns').reset_hunk)
    -- Preview
    vim.keymap.set({ 'n', 'v' }, '<leader>hp', require('gitsigns').preview_hunk)
    --Undo last stage operation
    vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk)
    --Navigate to next hunk in buffer
    vim.keymap.set('n', ']c', function() require('gitsigns').next_hunk({ wrap = true, preview = true }) end)
    vim.keymap.set('n', '[c', function() require('gitsigns').prev_hunk({ wrap = true, preview = true }) end)
    -- Operations on buffers --
    --Stage and reset
    vim.keymap.set('n', '<leader>bs', require('gitsigns').stage_buffer)
    vim.keymap.set('n', '<leader>br', require('gitsigns').reset_buffer)
    --Blame
    vim.keymap.set('n', '<leader>lb', function() require('gitsigns').blame_line({ full = true, ignore_whitespace = true}) end)

end

return {
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = config,
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '-' },
                changedelete = { text = '~' },
            },
        },
        event = { 'BufReadPre', 'BufNewFile' },
    },
}
