" ~/.vimrc

let mapleader = ' '

if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" Colors.
set background=dark
colors pencil

" Line numbers.
set number
set relativenumber

" Search.
set hlsearch
set ignorecase
set smartcase

" No backups.
set nobackup
set nowritebackup
set noswapfile
set autowrite

" Tabs.
set tabstop=2
set smartindent

" Splits.
set splitbelow
set splitright
set diffopt+=vertical

" Whitespace.
set list listchars=tab:\ \ ,trail:·

" Wrap at 79 chars.
set textwidth=79
set colorcolumn=+1

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Except commits, when the position is invalid or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  autocmd Filetype css,scss,sass,less,stylus setlocal iskeyword+=-
  autocmd Filetype make setlocal ts=8
augroup END

" Buffer/Tab management.
set hidden
nmap <leader>T :enew<cr>
nmap <leader>L :bnext<CR>
nmap <leader>H :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" Escape from Insert mode.
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Blackhole deletion.
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>C "_C
nnoremap <Leader>c "_c
nnoremap <Leader>x "_x

" Visual block move.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Use Q for formatting.
map Q gw

" Improved scrolling in wrapped lines.
nnoremap j gj
nnoremap k gk

" More specific marks.
nnoremap ' `
nnoremap ` '

" Clear searches.
nnoremap <leader>/ :noh<CR>

" Quit all with one hand.
nmap ZA :qa<CR>

" Map <CR> to :.
nnoremap <CR> :
