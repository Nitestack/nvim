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

return M
