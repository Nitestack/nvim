return utils.lsp.load_language({
  treesitter = {
    "markdown",
    "markdown_inline",
  },
  plugins = {
    { import = "lazyvim.plugins.extras.lang.markdown" },
  },
})
