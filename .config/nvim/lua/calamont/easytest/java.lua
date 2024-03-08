-- Custom Lua to run current Java test with Gradle
local treesitter = require 'calamont.easytest.treesitter'

local JAVA_FUNCTION_DECLARATION_NODE = 'method_declaration'
local JAVA_CLASS_DECLARATION_NODE= 'class_declaration'

function _G.run_function_test()
  local filepath = vim.fn.expand('%:r')
  local project_dir = get_project_directory(filepath)
  local package_name = get_package_name()
  -- TODO: handle nil return value
  local class_name = treesitter.get_ancestor_node_name(JAVA_CLASS_DECLARATION_NODE)
  local function_name = treesitter.get_ancestor_node_name(JAVA_FUNCTION_DECLARATION_NODE)
  local test_filter = package_name .. '.' .. class_name .. '.' .. function_name
  local command = '!./gradlew test --project-dir ' .. project_dir .. ' --tests ' .. test_filter
  vim.cmd(command)
end

function _G.run_module_tests()
  local filepath = vim.fn.expand('%:r')
  local project_dir = get_project_directory(filepath)
  local package_name = get_package_name()
  -- TODO: handle nil return value
  local command = '!./gradlew test --project-dir ' .. project_dir .. ' --tests \'' .. package_name .. '*\''
  vim.cmd(command)
end

function get_package_name()
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)
  if not first_line then
    return nil
  end

  local PACKAGE_PATTERN = 'package '
  local _, end_index = string.find(first_line[1], PACKAGE_PATTERN)
  if not end_index then
    return nil
  end
  return string.sub(first_line[1], end_index+1 ,-2)
end

local function get_parent_directory(filepath)
  return string.gsub(filepath, "/[^/]*$", "", 1)
end

local function contains_build_script(filepath)
  local f = io.open(filepath .. '/build.gradle', 'r')
  if f then
    f:close()
    return true
  end
  return false
end

function get_project_directory(filepath)
  while not contains_build_script(filepath) or not filepath do
    filepath = get_parent_directory(filepath)
  end

  if not filepath then
    return nil
  end
  return filepath

end
