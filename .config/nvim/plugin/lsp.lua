-- Advertise completion capabilities to LSPs
-- TODO: Delete line below if the tbl merge is a better approach
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
require'lspconfig'.jdtls.setup{
  capabilities = capabilities
}
require'lspconfig'.terraformls.setup{
  filetypes = { "terraform" , "tf" }
}
-- TODO: set up YAML lsp server

-- TODO: hide the keymap configuration in an autocmd. As per the docs:
-- To use other LSP features like hover, rename, etc. you can setup some
-- additional keymaps. It's recommended to setup them in a |LspAttach| autocmd to
-- ensure they're only active if there is a LSP client running. An example:
-- >
--     vim.api.nvim_create_autocmd('LspAttach', {
--       callback = function(args)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
--       end,
--     })
--  This blog has some useful information
--  https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/


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
    vim.diagnostic.goto_next,
    { noremap = true, desc = 'Go to the next error message.' }
)
