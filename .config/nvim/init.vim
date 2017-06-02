" Std shell for addons and such
" -----------------------------
if &shell =~# 'fish$'
  set shell=sh
endif

let g:is_posix = 1

" Python plugin update function
" -----------------------------
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins
" -----------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-scripts/SyntaxRange'
Plug 'jceb/vim-orgmode'
Plug 'bogado/file-line'
Plug 'vim-scripts/Zmrok'
Plug 'vim-scripts/Skittles-Dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'rosstimson/scala-vim-support', { 'for': 'scala' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/jQuery'
Plug 'othree/xml.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle' ] }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'kchmck/vim-coffee-script'
Plug 'Keithbsmiley/swift.vim', { 'for': 'swift' }
Plug 'vim-scripts/logstash.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'cstrahan/vim-capnp'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-pencil'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mattn/webapi-vim'
Plug 'urthbound/hound.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs',
Plug 'jeetsukumaran/vim-indentwise'
Plug 'neomake/neomake'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'swekaj/php-foldexpr.vim', { 'for': 'php' }
call plug#end()

" Maybe someday:
" Plug 'jreybert/vimagit', { 'on': 'Magit' }

" -----------------------------------------------------------------------------
" Built in config options
" -----------------------------------------------------------------------------

syntax on
set hidden
set hlsearch
set incsearch
set nu
set foldcolumn=1
set nofoldenable
set foldmethod=expr
set textwidth=0
set mouse=a
set spellcapcheck=
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2

" Filetype stuff
" ---------------------------
filetype on
filetype plugin on
filetype indent on

" Map Leader
" ---------------------------
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Easy Escapes
" ---------------------------
inoremap jk <Esc>
tnoremap <Esc><Esc> <C-\><C-n>

" Folding
" ---------------------------
set fillchars=fold:-
set foldlevelstart=1
set foldmethod=syntax
let javaScript_fold = 1
let b:phpfold_text_right_lines = 1
let b:phpfold_docblocks = 1

" Split term stuff
" ---------------------------

" Open a split terminal at the current buffers dir
function! STermHere()
  exe "lcd %:h"
  split
  lcd -
  wincmd j
  terminal fish
endfunction

command! STermHere call STermHere()
nnoremap <leader>th :STermHere<CR>

" Open a split terminal
function! STerm()
  split
  wincmd j
  terminal fish
endfunction

command! STerm call STerm()
nnoremap <leader>t :STerm<CR>


" Colors & look
" ---------------------------
colorscheme elflord
hi FoldColumn           ctermfg=2   ctermbg=235   cterm=none
hi SignColumn           ctermfg=2   ctermbg=235   cterm=none
hi Folded               ctermfg=14  ctermbg=235   cterm=none
hi Search               ctermfg=4   ctermbg=232   cterm=none
hi IncSearch            ctermfg=1   ctermbg=232   cterm=none
hi VertSplit            ctermfg=0   ctermbg=233   cterm=none
hi StatusLine           ctermfg=1   ctermbg=233   cterm=none
hi StatusLineNC         ctermfg=11  ctermbg=233   cterm=none
hi LineNr               ctermbg=235
hi Comment              ctermfg=243
hi TermCursor           ctermfg=2   ctermbg=232  cterm=none
hi CursorLine                       ctermbg=233  cterm=none
hi MatchParen           ctermfg=13  ctermbg=233  cterm=none
hi Visual               ctermfg=13  ctermbg=233  cterm=none
hi Todo                 ctermfg=233 ctermbg=5    cterm=none
hi DiffAdd              ctermfg=234 ctermbg=5    cterm=none
hi DiffChange           ctermfg=236 ctermbg=5    cterm=none
hi DiffDelete           ctermfg=2   ctermbg=235  cterm=none
hi SpellCap             ctermfg=236 ctermbg=5    cterm=none


" -----------------------------------------------------------------------------
" Plugin config options
" -----------------------------------------------------------------------------

" FZF
" ---------------------------
nmap <leader><tab> :Buffers<CR>
nmap <leader>// :Files<CR>

" Inspectors -- tagbar, et al
" ---------------------------
nmap <leader>it :Tagbar<CR>
nmap <leader>if :NERDTree<CR>
nmap <leader>in :NERDTreeToggle<CR>
nmap <leader>iu :UndotreeToggle<CR>
nmap <leader>is :Gstatus<CR>
nmap <leader>id :Gdiff<CR>

" Airline config
" ---------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'behelit'
let g:airline#extensions#tmuxline#enabled = 0

" Go config
" ---------------------------
let g:go_fmt_command = "goimports"

" Deoplete config
" --------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

nmap <leader>dt :call deoplete#toggle()<CR>
set completeopt-=preview

" Ultisnips
" --------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" TernJS
" --------------------------------------------------
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 1
let g:tern_map_keys = 1

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Peekaboo
" --------------------------------------------------
let g:peekaboo_delay = 950

" Neomake
" --------------------------------------------------
au BufWritePost * Neomake

" Always show sign column
" --------------------------------------------------
au BufEnter * sign define dummy
au BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Colon breaks words in php
" --------------------------------------------------
au Filetype php set isk-=58

" Location window bindings
" --------------------------------------------------
nmap <Leader>lo :lopen<CR>
nmap <Leader>lc :lclose<CR>
nmap <Leader>ll :ll<CR>
nmap <Leader>ln :lnext<CR>
nmap <Leader>lp :lprev<CR>

" Ripgrep madness
" --------------------------------------------------

" borrowed from: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.hn59jpl2n
command! -bang -nargs=* Ripgrep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Ctrl-K ripgreps for word under cursor
nnoremap <C-k> :Ripgrep<space><C-R><C-W>

" Platform and env-specific configs
" --------------------------------------------------
if has('macunix')
  source $HOME/.config/nvim/init.osx.vim
elseif has("unix")
  source $HOME/.config/nvim/init.linux.vim
endif

let b:local_config_file = $HOME . "/.config/nvim/init.local.vim"

if filereadable(b:local_config_file)
  execute 'source' b:local_config_file
endif
