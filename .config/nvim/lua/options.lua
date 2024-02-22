local o = vim.opt
-- General options and configurations
--Highlight on search
o.hlsearch = true
o.incsearch = true
--Make relative line numbers default
o.number = true
o.relativenumber = true
--Enable mouse mode
o.mouse = 'a'
--Let lines trail off screen
o.wrap = false
--Save undo history
o.undofile = true
--Case insensitive searching UNLESS /C or capital in search pattern
o.ignorecase = true
o.smartcase = true
--Decrease update time
o.updatetime = 100
o.signcolumn = 'number'
--Set colorscheme
o.termguicolors = true
o.guicursor = ''
--Window splitting to my liking
o.splitright = true
o.splitbelow = true
--Show incremental commands in status line
o.showcmd = true
o.inccommand = 'split'
--Show matching brackets
o.showmatch = true
--Set minimum line/col buffers for scrolling
o.scrolloff = 8
o.sidescrolloff = 5
--Highlight current line number
o.cursorline = true
o.cursorlineopt = 'number'
--Live life dangerously
o.swapfile = false
o.hidden = true
o.autowrite = true
--Better visual feedback in status line for menus
o.wildmenu = true
o.wildignorecase = true
--Set completeopt to provide sane completions
o.completeopt = 'menuone,noselect'
--Set marker to show textwidth
o.textwidth = 120
o.colorcolumn = '+1'

-- Set color
o.background = 'dark'
