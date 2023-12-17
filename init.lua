if vim.env.VSCODE then
  vim.g.vscode = true
end

_G.core = {}

_G.core.map = require("utils.mappings").map
_G.core.lazy_map = require("utils.mappings").lazy_map
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
