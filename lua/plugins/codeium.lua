---@type LazyPluginSpec
return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  keys = core.lazy_map({
    i = {
      ["<Tab>"] = {
        function()
          return vim.fn["codeium#Accept"]()
        end,
        "Codeium: Accept suggestion",
      },
    },
  }, {
    expr = true,
  }),
}
