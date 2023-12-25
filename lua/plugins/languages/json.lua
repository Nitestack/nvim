return utils.lsp.load_language({
  treesitter = {
    "json",
    "json5",
    "jsonc",
  },
  mason = {
    "prettierd",
    "jsonlint",
  },
  plugins = {
    { import = "lazyvim.plugins.extras.lang.json" },
  },
  linter = {
    linters_by_ft = {
      ["json"] = { "jsonlint" },
    },
  },
  formatter = {
    formatters_by_ft = {
      ["json"] = { "prettierd" },
      ["jsonc"] = { "prettierd" },
    },
  },
})
