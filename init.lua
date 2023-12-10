_G.core = {}
_G.core.map = require("utils.mappings").map
_G.core.lazy_map = require("utils.mappings").lazy_map
_G.core.icons = require("core.icons")
_G.core.config = require("core.config")

_G.utils = {}
_G.utils.general = require("utils.general")
_G.utils.lsp = require("utils.lsp")

require("utils.loaders").load_plugins(require("core.lazy"))
