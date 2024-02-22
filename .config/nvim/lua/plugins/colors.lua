return {
    {
        'ellisonleao/gruvbox.nvim',
        lazy = true,
        config = function()
            local colorscheme = 'gruvbox'
            local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
            if not ok then
              vim.notify('colorscheme ' .. colorscheme .. ' is not available')
            else
              vim.g.gruvbox_contrast_dark = 'hard'
            end
        end
    }
}
