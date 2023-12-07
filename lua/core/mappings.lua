local M = {}

---@type Mappings
M.mappings = {
  [{ "n", "v" }] = {
    ["<leader>d"] = {
      [["_d]],
      "Delete into void register",
    },
  },
}

---@type KeymapOpts
M.mapping_opts = {
  silent = true,
  noremap = true,
}

return M
