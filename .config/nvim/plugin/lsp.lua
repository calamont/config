-- Advertise completion capabilities to LSPs
-- TODO: Delete line below if the tbl merge is a better approach
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup {
  cmd = { os.getenv( "HOME" ) .. "/language_servers/lua-language-server/bin/lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        -- Disable library/framework suggestions. See this discussion for more context:
        -- https://github.com/LuaLS/lua-language-server/discussions/1688
        -- checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.config('basedpyright', {})
vim.lsp.enable('basedpyright')
require'lspconfig'.ts_ls.setup{
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
require'lspconfig'.jdtls.setup{
  cmd = { os.getenv( "HOME" ) .. "/language_servers/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls" },
  capabilities = capabilities
}
require'lspconfig'.terraformls.setup{
  filetypes = { "terraform" , "tf" }
}
require'lspconfig'.kotlin_language_server.setup{
  cmd = { os.getenv( "HOME" ) .. "/language_servers/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" },
  filetypes = { "kotlin" , "kt", "kts" }
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
    'gt',
    vim.lsp.buf.type_definition,
    { noremap = true, desc = 'Go to type definition of the object.' }
)
vim.keymap.set(
    'n',
    'gr',
    vim.lsp.buf.references,
    { noremap = true, desc = 'Go to references of the object.' }
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
    vim.lsp.buf.format,
    { noremap = true, desc = 'Formats the current buffer.' }
)
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { noremap = true, desc = 'Perform code action.' })
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { noremap = true, desc = 'Go to the next error message.' }
)
vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { noremap = true, desc = 'Go to the previous error message.' }
)
