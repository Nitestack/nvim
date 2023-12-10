local M = {}

---@param plugins string[]
---@return LazySpec
function M.disabled_plugins(plugins)
  local spec = {}

  for _, plugin in ipairs(plugins) do
    table.insert(spec, {
      plugin,
      enabled = false,
    })
  end

  return spec
end

function M.is_win()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

function M.is_linux()
  return vim.loop.os_uname().sysname == "Linux"
end

---@param paths string|string[]
function M.resolve_path(paths)
  local unresolved_path
  local path_sep = package.config:sub(1, 1)

  if type(paths) == "string" then
    unresolved_path = paths
  else
    unresolved_path = table.concat(paths, path_sep)
  end

  if M.is_win() then
    return string.gsub(unresolved_path, "/", path_sep)
  else
    return string.gsub(unresolved_path, "\\", path_sep)
  end
end

return M
