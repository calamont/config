local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {'node_modules/', '__pycache__/', 'venv/', '*.pyc'},
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_cat.new,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
        }
    }
}

require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/",
    })
end

local function cheatsheet(query)
    local query = query:gsub(' ', '+')
    local filetype = vim.bo.filetype
    print(filetype)
    -- TODO: currently this command appends to a file, meaning if we run repeated queries
    -- the file will contain results for _all_ queries. It would be useful for this to clear
    -- or delete any previous snippets file created before adding in the new results.
    local command = 'silent !cht.sh ' .. filetype .. '/' .. query .. ' > $HOME/dotfiles/nvim/tmp/cheatsheet/snippet.py'
    vim.cmd(command)
    -- immediately save file so we don't have to force close it
    -- vim.api.nvim_command('w')
end

local function create_document(prompt_buffnr, map)
    map('i', '<CR>', function()
	local text = require('telescope.actions.state').get_current_line(prompt_bufnr)
	cheatsheet(text)
    end)
end

M.cheatsheet_snippet = function()
    require("telescope.builtin").find_files({
        prompt_title = "< cht.sh >",
        cwd = "$HOME/dotfiles/nvim/tmp/cheatsheet/",
	layout_strategy = "vertical",
        attach_mappings = function(prompt_bufnr, map)
            create_document(prompt_bufnr, map)
            -- Please continue mapping (attaching additional key maps):
            -- Ctrl+n/p to move up and down the list.
            return true
	end
    })
end

return M
