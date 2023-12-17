---@class UserConfig
---@field disabled_plugins string[]
---@field lazyvim LazyVimOptions
---@field ui UserConfigUI
---@field plugins UserConfigPlugins

---@class UserConfigUI
---@field logo string Generate ANSI art with: https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow
---@field width number
---@field height number
---@field transparent { enabled: boolean, floats: boolean }

---@class UserConfigPlugins
---@field mason string[]
---@field treesitter string[]

---@type UserConfig
---@diagnostic disable-next-line: missing-fields
local M = {}

M.lazyvim = {
  colorscheme = "catppuccin",
  news = {
    lazyvim = true,
    neovim = true,
  },
}

M.ui = {
  logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
  transparent = {
    enabled = true,
    floats = false,
  },
  width = 0.8,
  height = 0.8,
}

M.plugins = {
  mason = {},
  treesitter = {
    "css",
  },
}

M.disabled_plugins = {
  "folke/flash.nvim",
  "rcarriga/nvim-notify",
}

return M
