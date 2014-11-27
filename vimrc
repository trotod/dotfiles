" ~/.vimrc

" head {{{

set nocompatible
filetype off
let mapleader = ' '

" windows rtp
if has('win32')
  set rtp+=$HOME/.vim
endif

" source plugins
if filereadable(expand('~/.vimrc.plugs'))
  source ~/.vimrc.plugs
endif

filetype plugin indent on

" }}}

" general {{{

set backspace=indent,eol,start " backspaces
set history=50                 " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set hidden                     " buffers can exist in background
set number                     " line numbers
set relativenumber             " make relative

" highlighting
syntax on
set hlsearch  " highlight searches
set incsearch " as typed

" search
set ignorecase
set smartcase
runtime! macros/matchit.vim " extended regexp matching

" Backups and Writes
set nobackup
set nowritebackup
set noswapfile
set autowrite

" Tabs
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set expandtab

" Scrolling
set scrolloff=7
set sidescrolloff=15
set sidescroll=1

" Splits
set splitbelow
set splitright

" fileformats
set fileformat=unix
set fileformats=unix,dos

" Whitespace
set list listchars=tab:»·,trail:·

" diffs
set diffopt+=vertical " force vertical splits

" Mouse
if has('mouse')
  set mouse=a
endif

" }}}

" autocmds {{{

augroup vimrcEx

  autocmd!

  " text files have tw=72
  autocmd FileType text setlocal textwidth=72

  autocmd FileType make setlocal ts=8 sts=8 sw=8 noet

  " markdown files wrap at 80 chars
  autocmd BufRead,BufNewFile *.md setlocal tw=80

  " When editing a file, always jump to the last known cursor position.
  " Except commits, when the position is invalid or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " use hypenation in autocompletion
  autocmd Filetype css,scss,sass setlocal iskeyword+=-

augroup END

" }}}

" gui {{{

if has('gui_running')
  set guifont=Sauce\ Code\ Powerline
  set guioptions=
endif

" }}}

" colors {{{

set background=dark
colors pencil

" }}}

" plugins {{{

" airline {{{

set laststatus=2
let g:airline_powerline_fonts = 1
set encoding=utf-8
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}

" easymotion {{{

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" }}}

" syntastic {{{

" assuming bower and stuff, yeah...
let g:syntastic_scss_sass_quiet_messages = { "regex": "File to import not found" }

" }}}

" latexbox {{{
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_Folding = 1

" }}}

" limelight + goyo {{{

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

nnoremap <Leader>G :Goyo<CR>

" }}}

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

" }}}

" }}}

" Commands {{{

" fuzzy writing
command W w
command Q q

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
