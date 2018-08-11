set nocompatible              " be iMproved, required
filetype off " required

:let mapleader=","

syntax enable

set lines=100 columns=250
set gfn=Monaco:h16
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
set colorcolumn=81
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fugitive'

Plugin 'mileszs/ack.vim'
Plugin 'szw/vim-tags'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'lilydjwg/colorizer'
Plugin 'jbgutierrez/vim-babel'
Plugin 'mattn/webapi-vim'
Plugin 'ctrlpvim/ctrlp.vim'

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

colorscheme evening

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on
syntax on
