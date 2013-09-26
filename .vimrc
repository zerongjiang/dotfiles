"---------
" General 
"---------
set nocompatible
set fileencodings=utf-8,gbk,cp936,ucs-bom,latin1
set encoding=utf-8
set nobackup
set noswapfile
set history=1024

set title
set number
set ruler
set showcmd
set laststatus=2
set wildmenu

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" mouse
set mouse=a

"---------
" Editing 
"---------
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" indent
set expandtab
set autoindent
set smartindent
"set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" File System
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

" Fast Moving
Bundle 'Lokaltog/vim-easymotion'

" Code Completion
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" Comment
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdcommenter'


" Cutting-edge Snips
Bundle  'SirVer/ultisnips'

" Todo
Bundle 'tsaleh/vim-matchit'
Bundle 'sjl/gundo.vim'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'

Bundle 'Lokaltog/vim-powerline'

"------------
" Deprecated
"------------

" Acient Snips
" Bundle 'msanders/snipmate.vim'
" Bundle 'scrooloose/snipmate-snippets'

" Antiquated Snips
" Bundle 'garbas/vim-snipmate'
" Snippets
" Bundle 'honza/vim-snippets'

" grabas/vim-snipmate dependecies
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'

" Bundle 'ervandew/supertab'
" Bundle 'Shougo/neocomplcache'

"---------------
" Color Schemes
"---------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'fisadev/fisa-vim-colorscheme'
Bundle 'chriskempson/base16-vim'

filetype plugin indent on
syntax on

color vividchalk
set background=dark

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

" Ack
nnoremap <leader>a :Ack 
" let g:user_emmet_leader_key = '<c-y>'

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let NERDChristmasTree=1
nnoremap <leader>d :NERDTreeToggle<cr>

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" neocomplcache
" let g:neocomplcache_enable_at_startup=1
" let g:neoComplcache_disable_auto_complete=0
" let g:neocomplcache_enable_smart_case=1
" let g:neocomplcache_min_syntax_length=3
" let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'
" let g:SuperTabDefaultCompletionType='<C-X><C-U>'

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" let g:Powerline_symbols = 'fancy'
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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
