vim.keymap.set(
    'n',
    '<Leader>gs',
    ':Git',
    { noremap = true, desc = 'Git status' }
)

vim.keymap.set(
    'n',
    '<Leader>gf:',
    ':Ge:',
    { noremap = true, desc = 'Git status - full screen' }
)

vim.keymap.set(
    'n',
    '<Leader>gu',
    ':Git push',
    { noremap = true, desc = 'Git push' }
)

vim.keymap.set(
    'n',
    '<Leader>gb',
    ':Git blame',
    { noremap = true, desc = 'Git blame' }
)

