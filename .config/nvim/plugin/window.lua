-- Default tab options
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true                   -- tabs are spaces
vim.opt_local.tabstop = 4                        -- number of visual spaces per TAB
vim.opt_local.softtabstop = 4                    -- number of spaces in tab when editing
vim.opt_local.shiftround = true
vim.opt_local.scrolloff = 4                      -- start scrolling X lines from screen top/bottom
vim.opt.wrap = false                             -- don't wrap text around

vim.opt.number = true                            -- show absolute line number for cursor
vim.opt.rnu = true                               -- turn on relative line numbers for other lines
vim.opt.list = true                              -- show whitespace
vim.opt.listchars = vim.opt.listchars + 'trail:•'-- show trailing whitespace with bullets
vim.opt.listchars = vim.opt.listchars + 'eol:⠀'  -- U+2800 (blank) - don't show eol

vim.opt.splitbelow = true                        -- open new split below
vim.opt.splitright = true                        -- open new vsplit to the right
vim.opt.fillchars = 'vert:┃'                     -- thicker border between panes
-- vim.opt.fillchars = 'vert:│'                  -- thinner border between panes
vim.api.nvim_set_hl(0, 'WinSeparator', {fg = '#888888'})

vim.opt.guicursor = ''                           -- block cursor in INSERT mode
vim.opt.termguicolors = true                     -- enable true colors support

-- Briefly highlight yanked region of text
local group = vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', { callback = function()
    vim.highlight.on_yank()
end, group = group })
