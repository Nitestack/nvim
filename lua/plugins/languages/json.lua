return utils.lsp.load_language({
  treesitter = {
    "json",
    "json5",
    "jsonc",
  },
  plugins = {
    { import = "lazyvim.plugins.extras.lang.json" },
  },
})
