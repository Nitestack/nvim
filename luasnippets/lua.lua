---@diagnostic disable: undefined-global
return {
  s(
    { trig = "lps", name = "Lazy plugin spec" },
    fmt(
      [[
        {1}
        {2} https://github.com/{3}
        {1}
        ---@type LazyPluginSpec
        return {{
          "{4}", 
          {5} 
          {6} 
          {7}
          opts = {{
            {8}
          }},
        }}
      ]],
      {
        f(require("utils.snippet").header_lines),
        f(require("utils.snippet").header_title),
        i(1, "PLUGIN_NAME"),
        rep(1),
        c(2, {
          sn(nil, fmt([[dependencies = "{}",]], { i(1, "DEPENDENCY") })),
          sn(nil, fmt([[dependencies = {{ {} }},]], { i(1, "DEPENDENCIES") })),
          t(""),
        }),
        c(3, {
          sn(nil, fmt([[event = "{}",]], { i(1, "EVENT") })),
          sn(nil, fmt([[event = {{ {} }},]], { i(1, "EVENTS") })),
          t(""),
        }),
        c(4, {
          t("keys = core.lazy_map({}),"),
          t(""),
        }),
        i(0),
      }
    )
  ),
  s(
    { trig = "la", name = "Add missing GitHub headers" },
    fmt(
      [[
      {1}
      {2} https://github.com/{3}
      {1}
    ]],
      {
        f(require("utils.snippet").header_lines),
        f(require("utils.snippet").header_title),
        i(1, "PLUGIN_NAME"),
      }
    )
  ),
}
