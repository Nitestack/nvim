---@diagnostic disable: undefined-global
return {
  s(
    { trig = "td", name = "TODO" },
    -- d
    fmt("{} {}", {
      d(1, function()
        local function with_cmt(cmt)
          return string.format(vim.bo.commentstring, " " .. cmt)
        end
        return s("", {
          c(1, {
            t(with_cmt("TODO:")),
            t(with_cmt("FIXME: ")),
            t(with_cmt("HACK: ")),
            t(with_cmt("BUG: ")),
          }),
        })
      end),
      i(0),
    })
  ),
  s(
    { trig = "hr", name = "Header" },
    fmt(
      [[
        {1}
        {2} {3}
        {1}
        {4}
          ]],
      {
        f(function()
          local comment = string.format(vim.bo.commentstring:gsub(" ", "") or "#%s", "-")
          local col = vim.bo.textwidth ~= 0 and vim.bo.textwidth or 80
          return comment .. string.rep("-", col - #comment)
        end),
        f(function()
          return vim.bo.commentstring:gsub("%%s", "")
        end),
        i(1, "HEADER"),
        i(0),
      }
    )
  ),
}
