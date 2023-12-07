local M = {}

---@type Mappings
M.mappings = {
  [{ "n", "v" }] = {
    ["<leader>d"] = {
      [["_d]],
      "Delete into void register",
    },
  },
  v = {
    ["<Tab>"] = {
      ">gv",
    },
    ["<S-Tab>"] = {
      "<gv",
    },
  },
}

---@type DisableMappings
M.unmappings = {
  [{ "n", "i", "v" }] = {
    "<A-j>",
    "<A-k>",
  },
  n = {
    -- Buffers
    "<S-h>",
    "<S-l>",
    "[b",
    "]b",
    "<leader>bb",
    "<leader>`",
    -- LazyVim terminal
    "<leader>ft",
    "<leader>fT",
    "<C-/>",
    "<C-_>",
  },
  v = {
    -- Indenting
    "<",
    ">",
  },
  -- LazyVim terminal
  t = {
    "<esc><esc>",
    "<C-h>",
    "<C-l>",
    "<C-k>",
    "<C-j>",
    "<C-/>",
    "<C-_>",
  },
}

---@type KeymapOpts
M.mapping_opts = {
  silent = true,
  noremap = true,
}

return M
