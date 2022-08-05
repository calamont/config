-- Nicer interarction with autocomplete/LSP
vim.opt.completeopt = { 'menu', 'noinsert', 'noselect' }
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- Avoid showing message extra message when using completion
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- Don't pop up autocompletion by default
vim.g.completion_enable_auto_popup = 0
vim.g.completion_enable_auto_hover = 0
-- let g:completion_enable_auto_signature = 0
