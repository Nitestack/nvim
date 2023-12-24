---@diagnostic disable: undefined-global
return {
  s(
    { trig = "lps", name = "Lazy plugin spec" },
    fmt(
      [[
        ---@type LazyPluginSpec
        return {{
          "{}", 
          {} 
          {} 
          {}
          opts = {{
            {}
          }},
        }}
      ]],
      {
        i(1, "PLUGIN_NAME"),
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
}
