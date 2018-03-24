""" general settings
set nocompatible "vi incompatible
set nobackup nowritebackup noswapfile "no swap files
set hidden "allow buffer switching without saving
set autoread "auto load files if they change outside of vim

set number "show line numbers
set cursorline "highlight current line
set colorcolumn=110 " highlight column 110 (80 is so restrictive :) )     80 ->|<-                     110 ->|<-
set textwidth=110 " when wrapping lines with gq, wrap to same column as above
highlight ColorColumn ctermbg=darkgray
set nowrap "don't wrap lines, let them run off window
set showmatch "jump briefly to matching brace if visible

set timeout timeoutlen=1000 ttimeoutlen=10 "no more delays for commands
set showcmd "show partial commands in statusline

" Set tabs to 4 spaces (preferred for Python. Fine for C++)
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab

syntax on
set incsearch "show next match while typing search
set ignorecase "case insensitive search
set smartcase "override case insensitivity if typed search contains upper case char
set hlsearch "highlight the search results

set splitbelow "open new hor splits below
set splitright "open new vert splits to the right

set tags=./tags; "search for tags from directory containing file -> upward

""" Plugin management
" autodownload vim-plug if not already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'

" Fuzzy finding
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" comment/uncomment with <leader>c[c|u]
Plug 'scrooloose/nerdcommenter'

" filetree
Plug 'scrooloose/nerdtree'

" kill buffer, but keep splits
Plug 'qpkorr/vim-bufkill'

" indent-based folding
Plug 'pseewald/anyfold'

" nice aligning
Plug 'godlygeek/tabular'

" auto tag generation and management
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" general completion
Plug 'ajh17/vimcompletesme'

" Python completion
Plug 'davidhalter/jedi-vim'

" LaTeX integration
Plug 'lervag/vimtex'
" surround segments with delimiters. Useful for TeX editing
Plug 'tpope/vim-surround'

" ROS commands in vim (:Rosed, :Roscd, etc.). Also maps :make to catkin build
"Plug 'taketwo/vim-ros'

" silly sublimetext-like minimap
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

"""Plugin-specific configurations

"" folding
let anyfold_activate=1
set foldlevel=0
highlight Folded ctermbg=None ctermfg=White cterm=underline

"" tagbar
map <F8> :TagbarToggle<cr>

"" nerdtree
nmap <F5> :NERDTreeToggle<cr>

"" vim completes me
let b:vcm_tab_complete = 'tags' "look for completions in tags files
autocmd FileType .vimrc let b:vcm_tab_complete = 'vim' "allow vim commands to autocomplete when editing vimrc

"" vimtex
let g:vimtex_compiler_method='latexmk'
let g:vimtex_complete_close_braces=1
let g:vimtex_view_method='zathura'
let g:vimtex_doc_handlers = ['texdoc']
function! TexDoc(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

let g:tex_flavor='latex'

augroup VimCompletesMeTex
    autocmd!
    autocmd FileType tex
                \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
    autocmd FileType tex
                \ let anyfold_activate = 0
    autocmd FileType tex
                \ let g:vimtex_fold_enabled = 1
    autocmd FileType tex
                \ let g:vimtex_complete_enabled = 1
    autocmd FileType tex
                \ let g:vimtex_complete_close_braces = 1

augroup END

"" fzf
" find files containing string
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"" vim-ros
let g:ros_make='current'
let g:ros_build_system='catkin-tools'
autocmd BufNewFile,BufRead *.launch setlocal ft=xml "edit launchfiles like xml

"" gnuplot files formatted like sh
autocmd BufNewFile,BufRead *.gnuplot setlocal ft=sh

""" General mappings and commands
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <- line("$") | exe "normal! g`\"" | endif

"easier split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


set exrc
set secure

