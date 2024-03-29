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
-- To managing undos
Plug 'mbbill/undotree'
-- Other convenience motions/actions
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

-- Colour schemes
Plug 'rose-pine/neovim'
Plug 'folke/tokyonight.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'glepnir/oceanic-material'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug('dracula/vim', { ['as'] = 'dracula' })

-- Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzy-native.nvim', {['do'] = 'make'})

-- LSP and other code intelligence
Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- updating the parsers on update
Plug 'nvim-treesitter/playground'
-- TODO: look into getting context - https://github.com/nvim-treesitter/nvim-treesitter-context

-- Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
-- TODO: Do I need these snippet autocompletes?
Plug 'saadparwaiz1/cmp_luasnip'
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v1.*'})

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

require('calamont.statusline')
require('calamont.easytest.java')
