"---------
" General 
"---------
set nocompatible
set fileencodings=utf-8,gbk,cp936,ucs-bom,latin1
set backup
set history=1024

set title
set number
set ruler
set showcmd
set laststatus=2
set wildmenu

" search
set incsearch
syntax on
set hlsearch
"set ignorecase
"set smartcase

" mouse
set mouse=a

"let mapleader=","
"let g:mapleader=","

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
" Bundle 'Shougo/neocomplcache'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'

" todo
" Bundle 'tsaleh/vim-matchit'
" Bundle 'sjl/gundo.vim'
" Bundle 'godlygeek/tabular'
" Bundle 'nathanaelkane/vim-indent-guides'

" snippet engines
" Bundle 'msanders/snipmate.vim'
Bundle 'garbas/vim-snipmate'

" Bundle 'ervandew/supertab'

" snippets
" Bundle 'scrooloose/snipmate-snippets'
Bundle 'honza/vim-snippets'

"--grabas/vim-snipmate dependecies--
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

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

filetype plugin indent on

color delek
set background=dark

"-------------
" Key Mapping
"-------------

" basic
nnoremap ; :

" navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let g:EasyMotion_leader_key = '<Leader>'

" NERDTree
let NERDTreeShowBookmarks=1
nnoremap <leader>nt :NERDTreeToggle<cr>

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=0
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

let g:SuperTabDefaultCompletionType='<C-X><C-U>'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

