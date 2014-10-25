" vim:fdm=marker

set nocompatible  " Vi IMproved!
filetype off      " will reenable
let mapleader = ' ' " map leader

if filereadable(expand('~/.vimrc.plugs'))
  source ~/.vimrc.plugs
endif

filetype plugin indent on

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

" no backups
set nobackup
set nowritebackup
set noswapfile
set autowrite     " automatically display changes

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

" Files

augroup vimrcEx
  autocmd!

  " text files have tw=72
  autocmd FileType text setlocal textwidth=72

  autocmd FileType make setlocal ts=8 sts=8 sw=8 noet

  " markdown files
  autocmd BufRead,BufNewFile *.md setlocal tw=80

  " When editing a file, always jump to the last known cursor position.
  " Except commits, when the position is invalid or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END

" GUI

if has('gui_running')
  set guifont=Sauce\ Code\ Powerline
  set guioptions=
endif

" Colors

set background=dark
colors pencil

" 'Tabs'

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

" Plugin Options

set grepprg=grep\ -nH\ $*

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
set encoding=utf-8
set noshowmode

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" syntastic
" not sure why this shows up...
"let g:syntastic_javascript_jshint_quiet_messages = { "level": "warnings",
"                                                   \ "type": "syntax",
"                                                   \ "regex": "ES5" }
" assuming bower and stuff, yeah...
let g:syntastic_scss_sass_quiet_messages = { "regex": "File to import not found" }

" latexbox
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_Folding=1

" limelight + goyo

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" Remaps and Commands

" Bind a load of keys to <Esc> key
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" save stuff faster
"nnoremap <Leader>w :w<CR>

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

" Goyo
nnoremap <Leader>G :Goyo<CR>

" clear searches
nnoremap <leader>/ :noh<CR>

" Convenient command to see the difference between
" the current buffer and the file it was loaded from,
" thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

if &shell =~# 'fish$'
  set shell=sh
endif
