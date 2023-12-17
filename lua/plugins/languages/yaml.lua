return utils.lsp.load_language({
  treesitter = {
    "yaml",
  },
  plugins = {
    { import = "lazyvim.plugins.extras.lang.yaml" },
  },
})
