-------------------------------------------------------------------------------
-- FOR EDITING
-------------------------------------------------------------------------------
-- Easier saving and quiting
vim.keymap.set(
    'n',
    '<Leader>w',
    ':w<CR>',
    { noremap = true, desc = 'Writes current buffer.' }
)
vim.keymap.set(
    'n',
    '<Leader>q',
    ':wq<CR>',
    { noremap = true, desc = 'Saves and closes current buffer.'}
)

-- Better search behaviour
vim.keymap.set(
    '',
    '<Leader><Leader>',
    ':nohlsearch<CR>',
    { desc = 'Quickly clear search highlighting.' }
)
vim.keymap.set(
    'n',
    '/',
    '/\\v',
    { noremap = true, desc = 'Search with "very magic" regex.' }
)
vim.keymap.set(
    'v',
    '/',
    '/\\v',
    { noremap = true, desc = 'Search with "very magic" regex.' }
)
vim.keymap.set(
    'c',
    '%s/',
    '%smagic/',
    { noremap = true, desc = 'Search and replace with "very magic" regex.' }
)

-- Autocomplete whole lines, useful for imports for new files in a project
vim.keymap.set(
    'i',
    '<C-l>',
    '<C-x><C-l>',
    { noremap = true, desc = 'Autocompletes whole lines.' }
)

-- Quickly delete contents within brackets and place in insert mode for editing
-- TODO: can we parameterise the bracket character to remove the repetition
-- below? Perhaps a lightweight plugin would be useful. Or possibly use treesitter?
vim.keymap.set(
    'n',
    'c]',
    'f]ci]',
    { noremap = true, desc = 'Change contents in next pair of square brackets.'}
)
vim.keymap.set(
    'n',
    'c)',
    'f)ci)',
    { noremap = true, desc = 'Change contents in next pair of parentheses.'}
)
vim.keymap.set(
    'n',
    'c}',
    'f}ci}',
    { noremap = true, desc = 'Change contents in next pair of curly braces.'}
)

-- The below commands will insert a blank line above and below the current line
vim.keymap.set(
    'n',
    '<Leader>ll',
    'm`O<Esc>``',
    { noremap = true, desc = 'Inserts a blank line above the cursor.' }
)
vim.keymap.set(
    'n',
    '<Leader>hh',
    'm`o<Esc>``',
    { noremap = true, desc = 'Inserts a blank line below the cursor.'}
)

-- Remapping for trimming characters at the end of a line.
-- - ma -> set mark for current position
-- - $x -> jump to end of line and delete one character
-- - `a -> return to original positino using the set mark
vim.keymap.set(
    'n',
    '<Leader>tr',
    'ma$x`a',
    { noremap = true, desc = 'Trims characters at the end of the line.'}
)

-- Remapping for moving the code/words that begin after column 80 to the line
-- below
-- - 80<Bar>   -> the equivalent of typing 80| - this goes to column 80
-- - Wi<BS>    -> go to beginning of next word, and remove whitespace between
-- - <CR><Esc> -> move remaining text on line to the line below and exit insert
vim.keymap.set(
    'n',
    '<Leader>j',
    '80<Bar>Wi<BS><CR><Esc>',
    { noremap = true, desc = 'Wraps text after column 80 onto the next line.'}
)

-------------------------------------------------------------------------------
-- FOR NAVIGATION
-------------------------------------------------------------------------------
-- Moving around panes more easily
vim.keymap.set(
    '',
    '<C-h>',
    '<C-w>h',
    { desc = 'Move cursor to the left split.' }
)
vim.keymap.set(
    '',
    '<C-l>',
    '<C-w>l',
    { desc = 'Move cursor to the right split.' }
)
vim.keymap.set(
    '',
    '<C-k>',
    '<C-w>k',
    { desc = 'Move cursor to the split above.' }
)
vim.keymap.set(
    '',
    '<C-j>',
    '<C-w>j',
    { desc = 'Move cursor to the split below.' }
)

vim.keymap.set(
    'n',
    '<C-d>',
    '<C-d>zz',
    { desc = 'Move a half page down and recentre the screen.' }
)
vim.keymap.set(
    'n',
    '<C-u>',
    '<C-u>zz',
    { desc = 'Move a half page up and recentre the screen.' }
)

-- For quickly switching between buffers
vim.keymap.set(
    'n',
    ']b',
    ':bnext<CR>',
    { noremap = true, desc = 'Goes to next buffer.' }
)
vim.keymap.set(
    'n',
    '[b',
    ':bprevious<CR>',
    { noremap = true, desc = 'Goes to previous buffer.' }
)
vim.keymap.set(
    'n',
    '<Leader>bb',
    '<C-^>',
    { noremap = true, desc = 'Returns to the last visited buffer.' }
)
vim.keymap.set(
    'n',
    '<Leader>dd',
    ':bdelete<CR>',
    { noremap = true, desc = 'Removes the current buffer from `buffers`.' }
)

vim.keymap.set(
    't',
    '<Esc>',
    '<C-\\><C-n>',
    { noremap = true, desc = 'Map <Esc> to exit terminal mode' }
)


-- Open and cycle through quickfix list
vim.keymap.set(
    'n',
    '<C-q>',
    ':copen<CR>',
    { noremap = true, desc = 'Opens quickfix list.' }
)
vim.keymap.set(
    'n',
    '<C-]>',
    ':cn<CR>',
    { noremap = true, desc = 'Goes to next item in quickfix list.' }
)
vim.keymap.set(
    'n',
    '<C-[>',
    ':cp<CR>',
    { noremap = true, desc = 'Goes to previous item in quickfix list.' }
)

-- Folding
vim.keymap.set(
    'n',
    'zf',
    'zMzvzO',
    { noremap = true, desc = 'Fold everything except the current node.' }
)
