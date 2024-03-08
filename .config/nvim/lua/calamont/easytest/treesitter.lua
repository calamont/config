local ts_utils = require("nvim-treesitter.ts_utils")
local q = require"vim.treesitter.query"

local treesitter = {}

local function find_ancestor_by_type(node, node_type)
  while node:type() ~= node_type do

    -- handling the edge cases like `doctype` node
    if node:parent() == nil then
      return
    end

    node = node:parent()
  end
  return node
end

local function get_node_identifier_string(node)
  local child_nodes = ts_utils.get_named_children(node)
  for _, child_node in ipairs(child_nodes) do
    if child_node:type() == 'identifier' then
      return q.get_node_text(child_node, 0)
    end
  end
  return nil
end

function treesitter.get_ancestor_node_name(node_type)
  local current_node = ts_utils.get_node_at_cursor()
  local ancestor_node = find_ancestor_by_type(current_node, node_type)
  if ancestor_node ~= nil then
    return get_node_identifier_string(ancestor_node)
  end
end

return treesitter
