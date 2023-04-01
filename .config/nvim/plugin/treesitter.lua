vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldenable=false

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection =  '<C-n>',  -- set to `false` to disable one of the mappings
      node_incremental = '<C-n>',
      scope_incremental = '<C-p>',  -- as far as I can tell this does nothing...
      node_decremental = '<C-m>',
    },
  },
}
