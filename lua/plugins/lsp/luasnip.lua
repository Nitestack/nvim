return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "Exafunction/codeium.vim",
  },
  keys = core.lazy_map({
    i = {
      ["<Tab>"] = {
        function()
          local luasnip = require("luasnip")
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            return vim.fn["codeium#Accept"]()
          end
        end,
        opts = {
          expr = true,
          silent = true,
        },
      },
    },
  }),
}
