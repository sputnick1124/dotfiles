return {
    {
        'sputnick1124/uiua.vim',
        ft = { "uiua" },
        config = function()
            vim.g.uiua_clip_command = 'xclip -selection clipboard'
        end
    }
}


