function _G.cheatsheet(query)
    local query = query:gsub(' ', '+')
    local filetype = vim.bo.filetype
    local file_ext = vim.fn.expand('%:e')
    -- TODO: currently this command appends to a file, meaning if we run repeated queries
    -- the file will contain results for _all_ queries. It would be useful for this to clear
    -- or delete any previous snippets file created before adding in the new results.
    local command = 'vnew /tmp/snippet.' .. file_ext .. ' | silent r !cht.sh ' .. filetype .. '/' .. query
    vim.cmd(command)
    -- immediately save file so we don't have to force close it
    vim.api.nvim_command('w')
end
