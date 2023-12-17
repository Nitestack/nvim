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

function M.version()
  local v = vim.version()

  local is_not_nightly = not v.prerelease
  if v then
    vim.notify(
      ("v%d.%d.%d (%s)"):format(v.major, v.minor, v.patch, is_not_nightly and "not nightly" or "nightly"),
      is_not_nightly and vim.log.levels.WARN or vim.log.levels.INFO,
      { title = "Neovim" }
    )
  end
end

function M.is_win()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

function M.is_linux()
  return vim.loop.os_uname().sysname == "Linux"
end

---@param paths string|string[]
function M.resolve_path(paths)
  return vim.fn.expand(type(paths) == "string" and paths or vim.fn.join(paths, "/"))
end

return M
