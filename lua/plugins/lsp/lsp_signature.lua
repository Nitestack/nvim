---@type LazyPluginSpec
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    handler_opts = {
      border = core.config.ui.transparent.floats and "rounded" or "none",
    },
  },
}
