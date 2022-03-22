"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                     ██████╗ █████╗ ██╗     ███████╗
"                    ██╔════╝██╔══██╗██║     ██╔════╝
"                    ██║     ███████║██║     ███████╗
"                    ██║     ██╔══██║██║     ╚════██║
"                    ╚██████╗██║  ██║███████╗███████║
"                     ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝
"
"                    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"                    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"                    ██║   ██║██║██╔████╔██║██████╔╝██║
"                    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" To comment and uncomment
Plug 'tpope/vim-commentary'
" For all your git needs
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" To handle create, delete, yank, change brackets
Plug 'tpope/vim-surround'

" For smooooooth scrolling
Plug 'karb94/neoscroll.nvim'

" Colour schemes
Plug 'folke/tokyonight.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', {'do': 'make'}

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " updating the parsers on update
Plug 'nvim-treesitter/playground'

call plug#end()

" COMPUTER SETTINGS/INTERACTIONS
" Tell nvim which python versions to use. This speeds up loading .py files.
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/Users/cal_lamont/.pyenv/shims/python'

scriptencoding utf-8

" Never ring bell. Could alse use :set noerrorbells
if exists('&belloff')
  set belloff=all
endif

" Allow mouse to interact with vim
set mouse=a

" Search down into folders. Provides tab-completion for all file-related tasks
set path+=**

" Unsure if I want the below on or not.
" If in git repo then move to the working tree root to assist with fuzzy
" searching
" TODO: check if Telescope does this by default. If so we could probably
" remove this
" let dirRoot = system("git rev-parse --show-toplevel")
" if (dirRoot =~ 'fatal') || (strlen(dirRoot) == 0)
"     let dirRoot = system("echo $PWD")
" endif
" execute ':cd ' . dirRoot

" Modify saving of backup files
if exists("$SUDO_USER")
    set nobackup                                 " don't create root owned files
    set nowritebackup                            " don't create root owned files
    set noswapfile                               " don't create root owned files
    set noundofile                               " don't create root owned files
else                                             " keep backup files out of the way
    set backupdir=~/.local/nvim/tmp/backup//     " // appends full file paths to dirs
    set backupdir+=~/.config/nvim/tmp/backup//
    set backupdir+=.
    set directory=~/.local/nvim/tmp/swap//
    set directory+=~/.config/nvim/tmp/swap//
    set directory+=.
    set undodir=~/.local/nvim/tmp/undo//
    set undodir+=~/.config/nvim/tmp/undo//
    set undodir+=.
    set undofile
endif

" Dont show certain filetypes when tab completing
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*.pyc

" Make space the leader key and backslash the space/<Right> key.
let mapleader = " "

" Easier saving and quiting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>

" Custom remappings for specific Lua functions
lua require('cal_lamont')
lua require('cal_lamont.cheatsheet')
lua require('cal_lamont.statusline')
" lua require('cal_lamont.cheatsheet')
nnoremap <Leader>cs :call v:lua.cheatsheet('')<left><left>
