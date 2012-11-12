" Load plugins using Pathogen
filetype off
call pathogen#runtime_append_all_bundles()

" -----------------------------------------------------------------------------
" main config options
" -----------------------------------------------------------------------------
syntax on
set hidden
set autochdir
set nocompatible
set hlsearch
set incsearch
set nu
set foldcolumn=2
set foldenable
set foldmethod=indent
set foldlevel=99
set shiftwidth=2
set tabstop=2
set textwidth=0
set mouse=a
set expandtab

" invoke filetype stuff
filetype on
filetype plugin on
filetype indent on

" colors & look
colorscheme elflord
hi FoldColumn           ctermfg=2   ctermbg=235   cterm=none
hi Search               ctermfg=3   ctermbg=0     cterm=none
hi VertSplit            ctermfg=0   ctermbg=233   cterm=none
hi StatusLine           ctermfg=1   ctermbg=233   cterm=none
hi StatusLineNC         ctermfg=11  ctermbg=233   cterm=none
hi LineNr               ctermbg=235

set fillchars=fold:-

" plugin configs
runtime macros/matchit.vim

let g:is_posix = 1
let Tlist_WinWidth=50
let Tlist_Compact_Format=1
nnoremap <silent> <F11> :TlistToggle<CR>
nmap <F12> :%! ~/bin/ispell-filter<CR>

let mapleader = "\<space>"
let g:mapleader = "\<space>"

" quick filetype hacks for tabs vs spaces
au FileType *    set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2
au FileType go   set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType java set textwidth=120|set shiftwidth=4|java set tabstop=4

" -----------------------------------------------------------------------------
" bundles
" -----------------------------------------------------------------------------
" Bundle: https://github.com/rosstimson/scala-vim-support.git
" Bundle: https://github.com/vim-scripts/IndexedSearch.git
" Bundle: https://github.com/bronson/vim-trailing-whitespace.git
" Bundle: https://github.com/tpope/vim-vividchalk.git
" Bundle: https://github.com/scrooloose/nerdcommenter.git
" Bundle: https://github.com/tpope/vim-surround.git
" Bundle: https://github.com/vim-scripts/taglist.vim
" Bundle: https://github.com/vim-scripts/Align.git
" Bundle: https://github.com/ervandew/supertab.git
" Bundle: https://github.com/vim-scripts/jQuery.git
" Bundle: https://github.com/othree/xml.vim.git
" Bundle: https://github.com/vim-scripts/Zmrok.git
" Bundle: https://github.com/vim-scripts/Skittles-Dark.git
" Bundle: https://github.com/Raimondi/delimitMate.git
" Bundle: https://github.com/scrooloose/nerdtree.git
" Bundle: https://github.com/vim-scripts/bufexplorer.zip.git
" Bundle: https://github.com/vim-scripts/nginx.vim.git
" Bundle: https://github.com/vim-scripts/Conque-Shell.git
" Bundle: https://github.com/vim-scripts/LustyExplorer.git
" Bundle: https://github.com/vim-scripts/actionscript.vim--Cuss.git
" Bundle: https://github.com/SirVer/ultisnips.git
" Bundle: https://github.com/vim-scripts/xemacs-mouse-drag-copy.git
