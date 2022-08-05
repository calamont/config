require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
require'lspconfig'.terraformls.setup{
  filetypes = { "terraform" , "tf" }
}
-- TODO: set up YAML lsp server

vim.keymap.set(
    'n',
    'gD',
    vim.lsp.buf.definition,
    { noremap = true, desc = 'Go to the object definition.' }
)
vim.keymap.set(
    'n',
    'gd',
    vim.lsp.buf.implementation,
    { noremap = true, desc = 'Go to implementation of the object.' }
)
vim.keymap.set(
    'n',
    '<leader>ls',
    vim.lsp.buf.signature_help,
    { noremap = true, desc = 'View function signature.' }
)
vim.keymap.set(
    'n',
    '<leader>lr',
    vim.lsp.buf.rename,
    { noremap = true, desc = 'Rename the object under the cursor.' }
)
vim.keymap.set(
    'n',
    '<leader>lh',
    vim.lsp.buf.hover,
    { noremap = true, desc = 'Displays hover information about the object under the cursor in a floating window.' }
)
vim.keymap.set(
    'n',
    '<leader>lf',
    vim.lsp.buf.formatting,
    { noremap = true, desc = 'Formats the current buffer.' }
)
vim.keymap.set(
    'n',
    '<leader>ld',
    vim.lsp.diagnostic.goto_next,
    { noremap = true, desc = 'Go to the next error message.' }
)
