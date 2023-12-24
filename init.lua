-- VSCode extension support (LazyVim handles it)
if vim.env.VSCODE then
  vim.g.vscode = true
end

if vim.loader then
  vim.loader.enable()
end

_G.core = {}

_G.core.ft_plugin = require("utils.loaders").load_ftplugin

_G.core.map = require("utils.mappings").map
_G.core.single_map = require("utils.mappings").single_map
_G.core.lazy_map = require("utils.mappings").lazy_map
_G.core.single_lazy_map = require("utils.mappings").single_lazy_map
_G.core.auto_cmds = require("utils.cmds").auto_cmds
_G.core.user_cmds = require("utils.cmds").user_cmds
_G.core.au_groups = require("utils.cmds").au_groups

_G.core.icons = require("core.icons")
_G.core.config = require("core.config")

_G.utils = {}
_G.utils.general = require("utils.general")
_G.utils.lsp = require("utils.lsp")

_G.dd = function(...)
  require("utils.debug").dump(...)
end

require("utils.loaders").load_plugins(require("core.lazy"))

-- Show version info
core.auto_cmds({
  {
    "User",
    {
      pattern = "VeryLazy",
      callback = function()
        utils.general.version()
      end,
    },
  },
})
