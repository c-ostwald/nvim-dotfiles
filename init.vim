" Be true vimmers and ensure nocompatible
set nocompatible

" Automatic reload of vimrc
" autocmd! bufwritepost init.vim source %

let g:python3_host_prog='C:\Users\Ossi\Envs\neovim3\Scripts\python.exe'
let g:python_host_prog='C:\Users\Ossi\Envs\neovim\Scripts\python.exe'

call GuiWindowMaximized(1)

" Turned on later necessary for some plugins
filetype off
" set the runtime path to include Vundle and initialize
call plug#begin('$USERPROFILE/AppData/Local/nvim/plugged')

" Syntax checker
Plug 'w0rp/ale'
" Open Files with fuzzy search
Plug 'kien/ctrlp.vim'
" Configurable context sensitive Statusline
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Async autocomplete complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Outine variable and functions
Plug 'taglist.vim'
" Insane git integration
Plug 'tpope/vim-fugitive'
" Browse files on your system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Work with 'surroundings'
Plug 'tpope/vim-surround'
" Repeat functions provided by plugins
Plug 'tpope/vim-repeat'
" Snippets
Plug 'SirVer/ultisnips' | 'honza/vim-snippets'

" PluginCollection for python developement
Plug 'klen/python-mode', { 'for': 'python' }
" Pytest Plugin
Plug 'alfredodeza/pytest.vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi'

" Rust configuration
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Clojure
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'clojure-vim/async-clj-omni'
" Plug 'tpope/vim-classpath', { 'for': 'clojure' }
" Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
Plug 'luochen1990/rainbow'

" Vim Script
Plug 'Shougo/neco-vim'

" Java
" Plug 'artur-shaik/vim-javacomplete2'

" TeX
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'matze/vim-tex-fold', { 'for': 'tex' }

"HTML5"
Plug 'othree/html5.vim'
"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

" ColorSchemes
Plug 'chriskempson/base16-vim'

" Automatically executes filetype plugin indent on and syntax enable
call plug#end()

" set leader key, increase timeout and show if leader is active
let mapleader=","
set timeout timeoutlen=1500
set showcmd

" make backspace normal
set bs=2

" allow buffers to be switched if they were modified
set hidden

""""""""""""""""
" Key bindings "
""""""""""""""""
" Quicksave
"" noremap <C-Y> :update<CR>
"" vnoremap <C-Y> <C-C>:update<CR>
"" inoremap <C-Y> <C-O>:update<CR>

" Quick exit
noremap <Leader>e :quit<C-R>	" Quit current window
noremap <Leader>E :qa!<C-R>	" Quit all windows

" bind Ctrl+<movement> keys to move around windows instead of using Crtl+w+<movement>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easier moving between buffers
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>

" remove highlight from last search
noremap <C-N> :nohl<CR>
vnoremap <C-N> :nohl<CR>
inoremap <C-N> :nohl<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks (dont loses selection)
vnoremap < <gv
vnoremap > >gv

" Split handling
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Open Outline (Taglist)
map <silent><Leader>o <esc>:TlistToggle<CR>

" Open NERDTree
map <silent><Leader>p <esc>:NERDTreeToggle<CR>

" folding
set nofoldenable
nnoremap <Leader>f za
nnoremap <Leader>F zA

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" PyTest shortcuts
" Execute the tests
autocmd FileType python nmap <silent><Leader>tf <Esc>:Pytest file<CR>
autocmd FileType python nmap <silent><Leader>tc <Esc>:Pytest class<CR>
autocmd FileType python nmap <silent><Leader>tm <Esc>:Pytest method<CR>
autocmd FileType python nmap <silent><Leader>tp <Esc>:Pytest project<CR>
" cycle through test errors
autocmd FileType python nmap <silent><Leader>tn <Esc>:Pytest next<CR>
autocmd FileType python nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
autocmd FileType python nmap <silent><Leader>te <Esc>:Pytest error<CR>


"""""""""""""""
" Look & feel "
"""""""""""""""
" show trailing whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colorscheme
set background=dark
" colorscheme base16-onedark
colorscheme base16-tomorrow-night
" colorscheme base16-gruvbox-dark-hard

" Diable beep and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" show line numbers
set number
set relativenumber
set nowrap      " Don't automatically wrap on load
set fo-=t       " Don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233 guibg=#434e56

" useful settings
set history=700
set undolevels=700

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable backups and swapfiles (especially usefule for file system watchers)
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""
" Plugin Config "
"""""""""""""""""
" vim-airline
set laststatus=2
" show open buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Ale Linter
let g:ale_linters = {'rust': ['rls']}

" ctrlp (open files with fuzzy search
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" python-mode
map <Leader>g :call RopeGotoDefinition()<C-R>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

" Open TagList on the right site
let Tlist_Use_Right_Window = 1

" Fancy status line symbols (needs powerline fonts https://github.com/powerline/fonts)
let g:airline_powerline_fonts = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set compiler to cargo for everything Rust related
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

" Java
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Java Script settings
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" TeX settings
let g:tex_falvor = 'latex'
let g:vimtex_complete_close_braces = 1
let g:vimtex_general_viewer = 'SumatraPDF'
let g:vimtex_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_general_options_latexmk = '-reuse-instance'

" Rainbows on
let g:rainbow_active = 1
