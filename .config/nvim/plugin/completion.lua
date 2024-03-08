-- TODO: Look further into customising nvim-cmp. This blog post has some useful
-- information: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- Nicer interarction with autocomplete/LSP
vim.opt.completeopt = { 'menu', 'noinsert', 'noselect' }
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- Avoid showing message extra message when using completion
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- Don't pop up autocompletion by default
vim.g.completion_enable_auto_popup = 0
vim.g.completion_enable_auto_hover = 0

local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete_common_string(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'buffer', keyword_length = 5 },
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'luasnip' }
  }
}
