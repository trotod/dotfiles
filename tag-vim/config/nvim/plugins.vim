scriptencoding utf-8

call plug#begin('~/.local/share/vim-plugins')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'elmcast/elm-vim'
Plug 'godlygeek/tabular'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'mattn/emmet-vim'
Plug 'mattn/flappyvird-vim'
Plug 'othree/yajs.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'w0rp/ale'
call plug#end()

" ale
let g:airline#extensions#ale#enabled = 1

" airline
set noshowmode
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'base16_shell'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = 'LN'
let g:airline_symbols.maxlinenr = ''

" easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" elm
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1 " requires elm-format

" javac
let g:syntastic_java_javac_config_file_enabled = 1

" latexbox
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_Folding = 1

" pandoc
let g:pandoc#formatting#mode = 'hA'

" goyo
nnoremap <Leader>G :Goyo<CR>

" syntax
let g:polyglot_disabled = ['javascript', 'markdown', 'elm']

" GitGutter
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete GitGutterChange

" emmet
let g:user_emmet_settings = {
  \ 'html': {
    \ 'indentation': '  '
    \ },
  \ }
