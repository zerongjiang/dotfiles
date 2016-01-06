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
set tabstop=2     " tab size
set softtabstop=2 " mix tab and space
set shiftwidth=2  " indent size

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

" Files, Buffers, Tabs
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'JazzCore/ctrlp-cmatcher'
" Plugin 'Shougo/unite.vim'
" Plugin 'bling/vim-bufferline'
Plugin 'szw/vim-ctrlspace'
" Plugin 'eshion/vim-sftp-sync'
" Plugin 'tpope/vim-vinegar'

" Fast Moving
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-expand-region'

" Code Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'denzeljiang/vim-eclim'

" Plugin 'Shougo/neocomplcache'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
" Plugin 'honza/vim-snippets'

" Plugin 'garbas/vim-snipmate'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'

" Productivity
Plugin 'terryma/vim-multiple-cursors'
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
" Plugin 'wellle/targets.vim'
Plugin 'christoomey/vim-tmux-navigator'

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
" Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bronson/vim-trailing-whitespace'

" Syntax
Plugin 'majutsushi/tagbar'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/syntastic'

" Search
Plugin 'mileszs/ack.vim'
" Plugin 'rking/ag.vim'

" Utils
" Plugin 'editorconfig/editorconfig-vim'
Plugin 'mhinz/vim-startify'
" Plugin 'mattn/gist-vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'Shougo/vinarise.vim'
" Plugin 'itchyny/calendar.vim'
Plugin 'vim-scripts/DrawIt'

" More filetype
Plugin 'chrisbra/csv.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
" Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'chase/vim-ansible-yaml'

" languages
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'yaymukund/vim-rabl'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/vim-cjsx'

"------------
" Deprecated
"------------

" Plugin 'L9'
" Plugin 'FuzzyFinder'

" Acient Snips
" Plugin 'msanders/snipmate.vim'
" Plugin 'scrooloose/snipmate-snippets'

" Plugin 'ervandew/supertab'

"---------------
" Color Schemes
"---------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'baskerville/bubblegum'
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'ciaranm/inkpot'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'fisadev/fisa-vim-colorscheme'
Plugin 'freeo/vim-kalisi'
Plugin 'jnurmine/Zenburn'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'junegunn/seoul256.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Pychimp/vim-luna'
Plugin 'Pychimp/vim-sol'
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'twerth/ir_black'
Plugin 'vim-scripts/tir_black'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'zeis/vim-kolor'

call vundle#end()
filetype plugin indent on
syntax on

set background=dark
colo Tomorrow-Night
" set background=light
" colo hybrid-light

"-------------
" Key Mapping
"-------------

" basic
let mapleader=","
" let mapleader="\<Space>"
nnoremap ; :
inoremap jj <Esc>

" delete and paste glitch
" noremap <Leader>p  "0p
" noremap <Leader>P  "0P
" vnoremap <Leader>p "0p
map <Leader>x  "_d
map Y  "+y

nnoremap <c-c>      :close<CR>
nnoremap <c-t>      :tabnew<CR>
nnoremap <c-x>      :tabclose<CR>

nnoremap <c-right>  :tabnext<CR>
nnoremap tj         :tabnext<CR>
inoremap <c-right>  <ESC>:tabnext<CR>

nnoremap <c-left>   :tabprevious<CR>
nnoremap tk         :tabprevious<CR>
inoremap <c-left>   <ESC>:tabprevious<CR>

nnoremap tt         :tablast<CR>

cnoremap vh vert bo h<space>

nnoremap <Leader>sh :leftabove vnew<CR>
nnoremap <Leader>sj :rightbelow new<CR>
nnoremap <Leader>sk :leftabove new<CR>
nnoremap <Leader>sl :rightbelow vnew<CR>

" navigation between split windows
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" no more hightlight
nnoremap <silent> <leader><Esc> :nohlsearch<CR><Esc>

nnoremap <leader>ev :vertical botright split $MYVIMRC<cr>
nnoremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo '.vimrc reloaded'"<CR>
command! W w !sudo tee % > /dev/null

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Ack
nnoremap <leader>a :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" expand-region
map K <Plug>(expand_region_expand)
" map J <Plug>(expand_region_shrink)

" Emmet
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
let NERDTreeQuitOnOpen=0
nnoremap <leader>dd :NERDTreeToggle<cr>
nnoremap <leader>df :NERDTreeFind<cr>

" nerdcommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" numbers
let g:numbers_exclude = ['help', 'gitcommit', 'nerdtree']

" fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>

" GitGutter
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
noremap <leader>gg :GitGutterToggle<CR>
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap <Leader>gv :GitGutterPreviewHunk<CR>
nnoremap <Leader>gc :GitGutterStageHunk<CR>
nnoremap <Leader>gr :GitGutterRevertHunk<CR>

" Tagbar
nnoremap <leader>] :TagbarToggle<CR>

" ctrlp
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_extensions = ['buffertag', 'funky']
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("h")': ['<c-i>']
  \ }
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden'
endif
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>ft :CtrlPBufTag<CR>
" funky
let g:ctrlp_funky_syntax_highlight=1
let g:ctrlp_funky_matchtype='path'
nnoremap <leader>ff :CtrlPFunky<CR>
" tjump
nnoremap <Leader>t :CtrlPtjump<cr>
" nnoremap <c-]> :CtrlPtjump<cr>

" CtrlSpace
nnoremap <leader>b :CtrlSpace<CR>
hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE
let g:ctrlspace_set_default_mapping=0
let g:ctrlspace_search_timing=[30,30]
let g:ctrlspace_unicode_font=1
let g:ctrlspace_use_ruby_bindings=1
if executable("ag")
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g "" --hidden'
endif

" neocomplcache
let g:acp_enableAtStartup=0
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_auto_completion_start_length=3
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" imap <C-j> <Plug>(neosnippet_expand_or_jump)
" smap <C-j> <Plug>(neosnippet_expand_or_jump)
" xmap <C-j> <Plug>(neosnippet_expand_target)
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)"
  " \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)"
  " \: "\<TAB>"
" let g:neosnippet#enable_snipmate_compatibility = 1

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'
let g:neocomplcache_omni_patterns.java = '\k\.\k*'

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
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
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
let g:airline#extensions#syntastic#enabled = 0
" let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#tabline#enabled = 1
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

" let g:airline_left_sep = ''
" let g:airline_left_sep = '▶'
let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = '◀'
let g:airline_right_sep = ''
" let g:airline_left_alt_sep = '⋅'
let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = '⋅'
let g:airline_right_alt_sep = ''
" let g:airline_symbols.linenr = 'L'
" let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = ''
" let g:airline_symbols.paste = 'P'
let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.branch = '±'
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.whitespace = '¶'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#whitespace#trailing_format = '▫[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = '▸[%s]'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" autocmd! BufWritePost .Xresources   !xrdb -load ~/.Xresources && urxvt -e bash -c "tmux att" &
autocmd! BufWritePost .Xresources   !xrdb -load ~/.Xresources

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
