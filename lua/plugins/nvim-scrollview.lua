---@type LazyPluginSpec
return {
  "dstein64/nvim-scrollview",
  event = "LazyFile",
  opts = {
    floating_windows = true,
    excluded_filetypes = {
      "neo-tree",
      "lazy",
      "mason",
      "dashboard",
      "Trouble",
      "trouble",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
}
