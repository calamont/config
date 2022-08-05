-------------------------------------------------------------------------------
--
--                     ██████╗ █████╗ ██╗     ███████╗
--                    ██╔════╝██╔══██╗██║     ██╔════╝
--                    ██║     ███████║██║     ███████╗
--                    ██║     ██╔══██║██║     ╚════██║
--                    ╚██████╗██║  ██║███████╗███████║
--                     ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝
--
--                    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
--                    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
--                    ██║   ██║██║██╔████╔██║██████╔╝██║
--                    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
--                     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
--                      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
--
-------------------------------------------------------------------------------

-- VimPlug has a few minor modifications when called from Lua
vim.call('plug#begin', '~/.config/nvim/plugged')

local Plug = vim.fn['plug#']

-- To comment and uncomment
Plug 'tpope/vim-commentary'
-- For git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
-- To create, delete, yank, change brackets
Plug 'tpope/vim-surround'

-- Colour schemes
Plug 'folke/tokyonight.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug('dracula/vim', { ['as'] = 'dracula' })

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzy-native.nvim', {['do'] = 'make'})

Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- updating the parsers on update
Plug 'nvim-treesitter/playground'

vim.call('plug#end')

-- Tell nvim which python versions to use. This speeds up loading .py files.
vim.g.python_host_prog  = '/usr/bin/python2'
vim.g.python3_host_prog = '~/.pyenv/shims/python'

-- Allow mouse to interact with vim
vim.opt.mouse = 'a'

-- Modify saving of backup files
if os.getenv("SUDO_USER") then
    -- don't create root owned files
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.swapfile = false
    vim.opt.undofile = false
else
    -- explicitly change the backupdir. The default is '.'
    local home = os.getenv('HOME')
    vim.opt.backupdir = {
        home .. '/.local/share/nvim/backup//',
    }
    vim.opt.backup = true
    vim.opt.undofile = true
end

-- Make space the leader key
vim.g.mapleader = " "

-- Custom remappings for specific Lua functions
require('cal_lamont')
require('cal_lamont.cheatsheet')
require('cal_lamont.statusline')
-- nnoremap <Leader>cs :call v:lua.cheatsheet('')<left><left>
