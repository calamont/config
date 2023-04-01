-- ROSE-PINE -------------------------------------------------------------------
-- vim.cmd[[colorscheme rose-pine]]

-- AYUCOLOR -------------------------------------------------------------------
-- vim.o.ayucolor = 'mirage'
-- vim.cmd[[colorscheme ayu]]
--
-- TOKYONIGHT -----------------------------------------------------------------
-- lua require('tokyonight')
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_italic_comments = 1
vim.g.tokyonight_italic_keywords = 0
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }


-- OCEANIC MATERIAL -----------------------------------------------------------
--  set background=dark
--  let g:oceanic_material_transparent_background = 1
--  let g:oceanic_material_allow_italic = 1
--  let g:oceanic_material_allow_bold = 0
--  let g:oceanic_material_background = 'medium'
--  colorscheme oceanic_material

-- let g:oceanic_next_terminal_bold = 0
-- let g:oceanic_next_terminal_italic = 1
-- c
-- Change line number colours from theme default
-- gruvbox (dark) - #bdae93
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7D7C8F' })

-- Change cursor line and column colour
-- ayu (mirage) - 323A4D
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#323A4D' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#323A4D' })
-- highlight StatusLine fg=#000000 bg=#323A4D

-- Change default message colours
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultError', { fg = '#FF3059' })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultWarning', { fg = '#FF7E00' })
vim.api.nvim_set_hl(0, 'LspDiagnosticsDefaultHint', { fg = '#73C202' })
-- Define colours for statusline. For some reason these 
vim.api.nvim_set_hl(0, 'SelectedWindow', { bg = '#afe46c' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#273747', fg = '#afe46c' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#1f2335', fg = '#afe46c' })
vim.api.nvim_set_hl(0, 'TimerNearEnd', { bg = '#d98026', fg = '#410b0b' })
vim.api.nvim_set_hl(0, 'TimerEnd', { bg = '#b94646', fg = '#410b0b' })
vim.api.nvim_set_hl(0, 'InactiveSplit', { bg = '#242839', fg = '#a9b1d6' })
vim.api.nvim_set_hl(0, 'Mode', { bg = '#273747', fg = '#afe46c' })
vim.api.nvim_set_hl(0, 'ModeAlt', { bg = '#273747', fg = '#afe46c' })
vim.api.nvim_set_hl(0, 'LineCol', { bg = '#273747', fg = '#afe46c' })
-- highlight StatusLineNC bg=#273747
vim.api.nvim_set_hl(0, 'MsgArea', { bg = '#273747' })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = '#273747' })

vim.cmd[[highlight link User9 SelectedWindow]]
vim.cmd[[highlight link User8 LineCount]]
vim.cmd[[highlight link User7 Filename]]
-- colorscheme OceanicNext
