---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  event = function()
    return {
      "LazyFile",
    }
  end,
}
