" ~/.vimrc

" head {{{

set nocompatible
filetype off
let mapleader = ' '

" windows rtp
if has('win32')
  set rtp+=$HOME/.vim
endif

" }}}

" plugins {{{

" set runtime path and call vim-plug
call plug#begin('~/.vim/plugged')

" syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'elmcast/elm-vim'
Plug 'junegunn/vim-journal'

" lints
Plug 'scrooloose/syntastic'
Plug 'editorconfig/editorconfig-vim'

" pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" colors
Plug 'reedes/vim-colors-pencil'

" interface
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/thumbnail.vim'

" shortcuts
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'

" interop
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" other plugins
Plug 'embear/vim-localvimrc'
Plug 'mattn/flappyvird-vim'

call plug#end()

" }}}

" general {{{

filetype plugin indent on

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set hidden
set number
set relativenumber

" highlighting
syntax on
set hlsearch
set incsearch

" search
set ignorecase
set smartcase
runtime! macros/matchit.vim

" Backups and Writes
set nobackup
set nowritebackup
set noswapfile
set autowrite

" Tabs
set tabstop=2
set autoindent
set smartindent
set smarttab
set expandtab

" Scrolling
set scrolloff=7
set sidescrolloff=15
set sidescroll=1

" Splits
set splitbelow
set splitright

" Whitespace
set list listchars=tab:\ \ ,trail:·

" diffs
set diffopt+=vertical " force vertical splits

" Mouse
if has('mouse')
  set mouse=a
endif

" Updatetime
set updatetime=500

" wrap at 80 chars
set textwidth=80
set colorcolumn=+1

" }}}

" autocmds {{{

augroup vimrcEx

  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Except commits, when the position is invalid or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " use hypenation in autocompletion
  autocmd Filetype css,scss,sass,less,stylus setlocal iskeyword+=-

augroup END

" }}}

" gui {{{

if has('gui_running')
  set guifont=Fira\ Mono
  set guioptions=
endif

" }}}

" colors {{{

set background=light
colors pencil

" }}}

" plugins {{{

" airline
set laststatus=2
set noshowmode
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" standardjs
let g:syntastic_javascript_checkers = ['standard']

" latexbox
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_Folding = 1

" goyo
nnoremap <Leader>G :Goyo<CR>

" syntax
let g:polyglot_disabled = ['javascript', 'markdown', 'elm']

" GitGutter
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete GitGutterChange

" }}}

" Remaps {{{

" 'Tabs' {{{

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>L :bnext<CR>

" Move to the previous buffer
nmap <leader>H :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" }}}

" Bind a load of keys to <Esc> key {{{
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
" }}}

" blackhole deletion {{{
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>C "_C
nnoremap <Leader>c "_c
nnoremap <Leader>x "_x
" }}}

" Move visual block {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

" ctags {{{
map <Leader>ct :!ctags -R .<CR>
" }}}

" misc {{{

" Don't use Ex mode, use Q for formatting
map Q gw

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" scrolling
nnoremap j gj
nnoremap k gk

" more specific
nnoremap ' `
nnoremap ` '

" clear searches
nnoremap <leader>/ :noh<CR>

" quit all with one hand
nmap ZA :qa<CR>

" map <CR> to :
nnoremap <CR> :

" }}}

" }}}

" Commands {{{

" fuzzy writing
if !exists(":W")
  command W w
endif

" fuzzy quitting
if !exists(":Q")
  command Q q
endif

" Convenient command to see the difference between
" the current buffer and the file it was loaded from,
" thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

" }}}

" misc {{{
if &shell =~# 'fish$'
  set shell=sh
endif
" }}}

" vim:fdm=marker
