set nocompatible              " be iMproved, required
filetype off " required

" :let mapleader=","
:let mapleader = "\<tab>"

syntax enable

set lines=100 columns=250
set gfn=OperatorMono:h16
set ruler
set number
set expandtab
set autoread
set shiftwidth=2
set softtabstop=2
set cursorline
set cursorcolumn
set wildmenu
set wildignore=*~,*.swp
set showcmd
set cmdheight=1
set nobackup
set nowb
set noswapfile
set autoindent
set smartindent
set nowrap
set linebreak
set backspace=indent,eol,start
set colorcolumn=80
set laststatus=2
set shell=/bin/sh
set tags=.git/tags

" Use ack instead of grep
set grepprg=ack

"" Custom settings
inoremap jj <esc>
inoremap jk <esc>

"" Search configuration
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Command-P
set wildignore+=coverage*
set wildignore+=*/tmp/*
set wildignore+=*/node_modules/*
set wildignore+=public/*
let g:CommandTMaxHeight=15

let g:ctrlp_custom_ignore = 'node_modules'

"" Remove whitespace after saving
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\t/  /e

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')


" My plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'

Plug 'mileszs/ack.vim'
Plug 'szw/vim-tags'
Plug 'thoughtbot/vim-rspec'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'
Plug 'lilydjwg/colorizer'
Plug 'jbgutierrez/vim-babel'
Plug 'mattn/webapi-vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/1.x' }

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'eslint'
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

map <C-t> :NERDTreeToggle<CR>

" nerdcommenter setup
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
map <silent> <C-n> :NERDTreeFocus<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

let g:UltiSnipsExpandTrigger="<C-l>"

" air-line
let g:airline_powerline_fonts = 1


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"     " unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" All of your Plugins must be added before the following line
call plug#end()            " required

colorscheme spacegray

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on
syntax on
