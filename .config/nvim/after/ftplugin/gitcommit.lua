local branch = io.popen'git rev-parse --abbrev-ref HEAD':read'*l'
local ticket_no = string.match(branch, '%a%a%a%-%d%d%d%d%d')
if ticket_no then
  vim.api.nvim_set_current_line(ticket_no .. ': ')
  vim.api.nvim_input('A')
end
