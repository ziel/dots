call plug#begin('~/.config/nvim/plugged')

Plug 'vim-scripts/Zmrok'
Plug 'vim-scripts/Skittles-Dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'rosstimson/scala-vim-support'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/jQuery'
Plug 'othree/xml.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/nginx.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'Keithbsmiley/swift.vim'
Plug 'vim-scripts/logstash.vim'
Plug 'fatih/vim-go'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/neosnippet'
Plug 'shougo/neosnippet-snippets'
Plug 'shougo/unite.vim'
Plug 'majutsushi/tagbar'
Plug 'cstrahan/vim-capnp'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'rust-lang/rust.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()


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
set spellcapcheck=

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
hi Comment              ctermfg=243

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

" dash!
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>D <Plug>DashGlobalSearch

" fzf!
nmap <leader><tab> :History<CR>
nmap <leader>/ :Files<CR>

" quick filetype hacks for tabs vs spaces
au FileType *    set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2
au FileType go   set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType make set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType java set textwidth=120|set shiftwidth=4|set tabstop=4

map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'behelit'
let g:airline#extensions#tmuxline#enabled = 0

" vim-go config
let g:go_fmt_command = "goimports"

