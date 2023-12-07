local M = {}

---@param config {options: vim.opt, globals: table, disabled_providers: string[], run: fun()}
function M.load_settings(config)
  for k, v in pairs(config.options) do
    vim.opt[k] = v
  end

  for k, v in pairs(config.globals) do
    vim.g[k] = v
  end

  for _, provider in ipairs(config.disabled_providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
  end

  config.run()
end

---@param mappings DisableMappings
function M.load_disabled_mappings(mappings)
  require("utils.mappings").disable_mapping(mappings)
end

---@param mappings Mappings
---@param unmappings DisableMappings
---@param mapping_opts? KeymapOpts
function M.load_mappings(mappings, unmappings, mapping_opts)
  require("utils.mappings").map(mappings, mapping_opts)
  require("utils.mappings").disable_mapping(unmappings)
end

---@param opts LazyConfig
function M.load_plugins(opts)
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

  require("lazy").setup(opts)
end

function M.load_commands() end

return M
