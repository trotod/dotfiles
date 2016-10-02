call plug#begin('~/.config/vim-plugins')
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'elmcast/elm-vim'
Plug 'embear/vim-localvimrc'
Plug 'godlygeek/tabular'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'mattn/emmet-vim'
Plug 'mattn/flappyvird-vim'
Plug 'othree/yajs.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" airline
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

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" standardjs
let g:syntastic_javascript_checkers = ['standard']

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
let g:pencil_gutter_color = 1

" emmet
let g:user_emmet_settings = {
  \ 'html': {
    \ 'indentation': '  '
    \ },
  \ }