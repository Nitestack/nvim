---@type LazyPluginSpec
return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  -- Check out lua/plugins/lsp/luasnip.lua under the mappings section
  keys = core.lazy_map({
    i = {
      ["<Tab>"] = {},
    },
  }),
}
