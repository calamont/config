vim.keymap.set(
    'n',
    '<Leader>ff',
    '<cmd>Telescope find_files<cr>',
    { noremap = true, desc = 'Opens fuzzy file finder.' }
)

vim.keymap.set(
    'n',
    '<Leader>fg',
    '<cmd>Telescope live_grep<cr>',
    { noremap = true, desc = 'Opens grep text search.' }
)

vim.keymap.set(
    'n',
    '<Leader>fb',
    '<cmd>Telescope buffers<cr>',
    { noremap = true, desc = 'Opens buffer selector.' }
)

vim.keymap.set(
    'n',
    '<Leader>ch',
    '<cmd>Telescope command_history<cr>',
    { noremap = true, desc = 'Opens command history.' }
)

vim.keymap.set(
    'n',
    '<Leader>fh',
    '<cmd>Telescope help_tags<cr>',
    { noremap = true, desc = 'Opens help tags.' }
)

vim.keymap.set(
    'n',
    '<Leader>fd',
    ':lua require("cal_lamont.telescope").search_dotfiles()<cr>',
    { noremap = true, desc = 'Opens dotfiles fuzzy finder.' }
)
