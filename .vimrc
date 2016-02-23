runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen
call pathogen#infect()

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

" clang complete (disabled since bundle is disabled)
" let g:clang_library_path ='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
" let g:clang_snippets = 1
" let g:clang_snippets_engine = 'ultisnips'
" let g:clang_close_previw = 1

" quick filetype hacks for tabs vs spaces
au FileType *    set expandtab|set tabstop=2|set shiftwidth=2|set softtabstop=2
au FileType go   set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType make   set noexpandtab|set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType java set textwidth=120|set shiftwidth=4|set tabstop=4

map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'behelit'
let g:airline#extensions#tmuxline#enabled = 0

" vim-go config
let g:go_fmt_command = "goimports"

" -----------------------------------------------------------------------------
" bundles (disabled)
" -----------------------------------------------------------------------------
" # Bundle: https://github.com/mhinz/vim-signify
" # Bundle: https://github.com/vim-scripts/IndexedSearch.git
" # Bundle: https://github.com/Raimondi/delimitMate.git
" # Bundle: https://github.com/vim-scripts/bufexplorer.zip.git
" # Bundle: https://github.com/vim-scripts/LustyExplorer.git
" # Bundle: https://github.com/vim-scripts/actionscript.vim--Cuss.git
" # Bundle: https://github.com/SirVer/ultisnips.git
" # Bundle: https://github.com/vim-scripts/xemacs-mouse-drag-copy.git
" # Bundle: https://github.com/Rip-Rip/clang_complete
" # Bundle: https://github.com/scrooloose/nerdcommenter.git
" # Bundle: https://github.com/edkolev/tmuxline.vim

" -----------------------------------------------------------------------------
" bundles
" -----------------------------------------------------------------------------
" Bundle: https://github.com/vim-airline/vim-airline
" Bundle: https://github.com/vim-airline/vim-airline-themes
" Bundle: https://github.com/altercation/vim-colors-solarized.git
" Bundle: https://github.com/rosstimson/scala-vim-support.git
" Bundle: https://github.com/bronson/vim-trailing-whitespace.git
" Bundle: https://github.com/tpope/vim-vividchalk.git
" Bundle: https://github.com/tpope/vim-surround.git
" Bundle: https://github.com/vim-scripts/taglist.vim
" Bundle: https://github.com/vim-scripts/Align.git
" Bundle: https://github.com/ervandew/supertab.git
" Bundle: https://github.com/vim-scripts/jQuery.git
" Bundle: https://github.com/othree/xml.vim.git
" Bundle: https://github.com/vim-scripts/Zmrok.git
" Bundle: https://github.com/vim-scripts/Skittles-Dark.git
" Bundle: https://github.com/scrooloose/nerdtree.git
" Bundle: https://github.com/vim-scripts/nginx.vim.git
" Bundle: https://github.com/kchmck/vim-coffee-script.git
" Bundle: https://github.com/tpope/vim-markdown
" Bundle: https://github.com/rizzatti/dash.vim
" Bundle: https://github.com/Keithbsmiley/swift.vim.git
" Bundle: https://github.com/vim-scripts/logstash.vim.git
" Bundle: https://github.com/fatih/vim-go.git
" Bundle: https://github.com/shougo/neocomplete.vim.git
" Bundle: https://github.com/shougo/neosnippet.vim.git
" Bundle: https://github.com/shougo/unite.vim
" Bundle: https://github.com/shougo/vimproc.vim
" Bundle: https://github.com/shougo/vimshell.vim
" Bundle: https://github.com/majutsushi/tagbar.git
" Bundle: https://github.com/cstrahan/vim-capnp.git
" Bundle: https://github.com/ardagnir/united-front.git
" Bundle: https://github.com/reedes/vim-pencil
" Bundle: https://github.com/junegunn/goyo.vim
