---@class UserConfig
---@field disabled_plugins string[]
---@field lazyvim LazyVimOptions
---@field ui UserConfigUI

---@class UserConfigUI
---@field width number
---@field height number
---@field transparent { enabled: boolean, floats: boolean }

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
  transparent = {
    enabled = true,
    floats = false,
  },
  width = 0.8,
  height = 0.8,
}

M.disabled_plugins = {
  "folke/flash.nvim",
  "akinsho/bufferline.nvim",
  "rcarriga/nvim-notify",
}

return M
