"---------
" General
"---------
set nocompatible
set fileencodings=utf-8,gbk,cp936,ucs-bom,latin1
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set history=1024
set hidden                  " hidden buffer when switching

" Appearance
set title
set number                  " show line numbers
set ruler                   " show the line and column number of the cursor position
set showcmd
set scrolloff=3
set laststatus=2            " always show status line
set wildmenu                " show tab completion on status line
set cursorline cursorcolumn " cursor position cross

" Search
set incsearch               " search as you type
set hlsearch                " highlight search
set ignorecase              " case-insensitive search
set smartcase               " case-sensitive if any caps

" Mouse
set mouse=a                 " enable mouse support

"---------
" Editing
"---------
set list
set listchars=tab:▸\ ,trail:▫,precedes:«,extends:»
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Indent
set expandtab     " expand tab to space
set autoindent    " copy indent from last line
set smartindent   " adjust indent after {, cinwords, }
" set smarttab    " <BS> delete 4 space
set tabstop=4     " tab size
set softtabstop=4 " mix tab and space
set shiftwidth=4  " indent size

" autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

set wrap

" jump to last known cursor position when opening a file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" diff current buffer and original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

"---------
" Plugins
"---------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" File System
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Fast Moving
Plugin 'Lokaltog/vim-easymotion'

" Code Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'dansomething/vim-eclim'

" Cutting-edge Snips
" Plugin  'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" Productivity
Plugin 'godlygeek/tabular'
" Plugin 'junegunn/vim-easy-align'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/matchit.zip'

" Comment
Plugin 'scrooloose/nerdcommenter'
" Plugin 'tpope/vim-commentary'

" VCS
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Plugin 'mhinz/vim-signify'
Plugin 'sjl/gundo.vim'

" UI-enhance
Plugin 'bling/vim-airline'
" Plugin 'Lokaltog/vim-powerline'

" Style guide
Plugin 'nathanaelkane/vim-indent-guides'

" Syntax
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

" Search
Plugin 'mileszs/ack.vim'
" Plugin 'rking/ag.vim'

" Utils
Plugin 'Shougo/vinarise.vim'
" Plugin 'itchyny/calendar.vim'
Plugin 'vim-scripts/DrawIt'

" More filetype
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
" Plugin 'puppetlabs/puppet-syntax-vim'

"------------
" Deprecated
"------------

" Plugin 'L9'
" Plugin 'FuzzyFinder'

" Acient Snips
" Plugin 'msanders/snipmate.vim'
" Plugin 'scrooloose/snipmate-snippets'

" Antiquated Snips
" Plugin 'garbas/vim-snipmate'
" Snippets
" Plugin 'honza/vim-snippets'

" grabas/vim-snipmate dependecies
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'

" Plugin 'ervandew/supertab'
" Plugin 'Shougo/neocomplcache'

"---------------
" Color Schemes
"---------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ciaranm/inkpot'
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'junegunn/seoul256.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'nanotech/jellybeans.vim'
Plugin 'rickharris/vim-blackboard'
Plugin 'rickharris/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-scripts/tir_black'
Plugin 'vim-scripts/xoria256.vim'

call vundle#end()
filetype plugin indent on
syntax on

set background=dark
colo molokai

"-------------
" Key Mapping
"-------------

" basic
" let mapleader=","
nnoremap ; :
imap jj <Esc>

" navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo '.vimrc reloaded'"<CR>
command! W w !sudo tee % > /dev/null

" Ack
nnoremap <leader>a :Ack<space>
" let g:user_emmet_leader_key = '<c-y>'

" EasyMotion
" let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let NERDChristmasTree=1
let NERDTreeChDirMode=2
nnoremap <leader>d :NERDTreeToggle<cr>

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" GitGutter
let g:gitgutter_enabled = 0
nmap <leader>g :GitGutterToggle<CR>

" Tagbar
nmap <leader>] :TagbarToggle<CR>

" ctrlp
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_show_hidden = 1
nmap <leader>b :CtrlPBuffer<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden'
endif

" neocomplcache
let g:neocomplcache_enable_at_startup=1
" let g:neocomplcache_enable_smart_case=1
" let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_enable_fuzzy_completion = 1
" inoremap <expr><C-g> neocomplcache#undo_completion()
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_key_invoke_completion = '<c-l>'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" powerline
let g:Powerline_symbols_override = {
            \ 'BRANCH': '±',
            \ 'LINE': 'L',
            \ }
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_R = 'R'
let g:Powerline_mode_v = 'V'
let g:Powerline_mode_V = 'V⋅L'
let g:Powerline_mode_cv = 'V⋅B'

" airline
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V⋅L',
    \ '' : 'V⋅B',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '⋅'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '⋅'
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.paste = 'P'
let g:airline_symbols.whitespace = '!'
let g:airline_symbols.branch = '±'
let g:airline#extensions#whitespace#trailing_format = '¶[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'Ξ[%s]'
" let g:airline#extensions#tabline#enabled = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
