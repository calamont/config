-- mostly taken from https://elianiva.my.id/post/neovim-lua-statusline
local fn = vim.fn
local api = vim.api
local M = {}

M.trunc_width = setmetatable({
  mode = 80,
  -- git_status = 80,
  filename = 140,
  line_col = 60,
}, {
  __index = function() return 80 end
})

M.is_truncated = function(_, width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

M.colors = {
  active        = '%#StatusLine#',
  inactive      = '%#InactiveSplit#',
  mode          = '%#StatusLine#',
  mode_alt      = '%#StatusLine#',
  git           = '%#Git#',
  git_alt       = '%#GitAlt#',
  filetype      = '%#Filetype#',
  filetype_alt  = '%#FiletypeAlt#',
  line_col      = '%#StatusLine#',
  line_col_alt  = '%#StatusLine#',
}

M.modes = setmetatable({
  ['n']  = {'Normal', 'N'};
  ['no'] = {'N·Pending', 'N·P'} ;
  ['v']  = {'Visual', 'V' };
  ['V']  = {'V·Line', 'V·L' };
  [''] = {'V·Block', 'V·B'};
  ['s']  = {'Select', 'S'};
  ['S']  = {'S·Line', 'S·L'};
  ['i']  = {'Insert', 'I'};
  ['ic'] = {'Insert', 'I'};
  ['R']  = {'Replace', 'R'};
  ['Rv'] = {'V·Replace', 'V·R'};
  ['c']  = {'Command', 'C'};
  ['cv'] = {'Vim·Ex ', 'V·E'};
  ['ce'] = {'Ex ', 'E'};
  ['r']  = {'Prompt ', 'P'};
  ['rm'] = {'More ', 'M'};
  ['r?'] = {'Confirm ', 'C'};
  ['!']  = {'Shell ', 'S'};
  ['t']  = {'Terminal ', 'T'};
}, {
  __index = function()
      return {'Unknown', 'U'} -- handle edge cases
  end
})

M.separators = {
  arrow = { '', '' },
  rounded = { '', '' },
  blank = { '', '' },
}

local active_sep = 'blank'

M.get_current_mode = function(self)
  local current_mode = api.nvim_get_mode().mode
  local truncated = self:is_truncated(self.trunc_width.mode)
  local idx = truncated and 2 or 1
  return string.format(' %s ', self.modes[current_mode][idx]):upper()
end

M.get_filename = function(self)
  if self:is_truncated(self.trunc_width.filename) then return " %<%f " end
  return " %<%F "
end

M.get_line_col = function(self)
  if self:is_truncated(self.trunc_width.line_col) then return ' %l:%c ' end
  return ' %4l/%2L |%3c '
end

set_session_start_time = function()
  -- vim.g.start_time = os.time()
  -- return vim.g.start_time
  return os.time()
end

M.get_session_duration = function(self)
  return os.time() - vim.g.start_time
end

M.set_active = function(self)
  local colors = self.colors
  local mode = self:get_current_mode()
  -- local mode_alt = colors.mode_alt .. self.separators[active_sep][1]
  local filename = self:get_filename()
  local line_col = self:get_line_col()
  local session_duration = self:get_session_duration()
  local total_secs = (25 * 60) - session_duration
  local mins, secs = math.floor(total_secs / 60), total_secs % 60

  local timer_color = '%#StatusLine#'
  -- if mins < 0
  -- then
  --   timer_color = '%#TimerEnd#'
  -- elseif mins < 5
  -- then
  --   timer_color = '%#TimerNearEnd#'
  -- end

  -- pad timer with zeros for aesthetics
  mins = string.format("%02d", mins)
  secs = string.format("%02d", secs)
  return table.concat({
    timer_color, mode, '%=', filename, '%=', mins, ':', secs, line_col
  })
end

M.set_inactive = function(self)
  return self.colors.inactive .. '%= %F % %='
end

M.set_explorer = function(self)
  local title = self.colors.mode .. ' test '
  return table.concat({ self.colors.active, title })
end

Statusline = setmetatable(M, {
  __call = function(statusline, mode)
    if mode == "active" then return statusline:set_active() end
    if mode == "inactive" then return statusline:set_inactive() end
    if mode == "explorer" then return statusline:set_explorer() end
  end
})

-- set timer
api.nvim_exec([[
  autocmd VimEnter * let start_time=v:lua.os.time()
]], false)

-- set statusline
  -- au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)

