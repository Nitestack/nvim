return utils.lsp.load_language({
  mason = {
    "powershell-editor-services",
  },
  lsp = {
    servers = {
      ---@type lspconfig.options.powershell_es
      powershell_es = {},
    },
  },
})
