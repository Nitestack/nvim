---@class MappingsConfig
---@field mappings Mappings
---@field unmappings DisableMappings
---@field mapping_opts KeymapOpts

---@type MappingsConfig
---@diagnostic disable-next-line: missing-fields
local M = {}

M.mappings = {
  n = {
    ["x"] = { "\"_x" },
    ["<Tab>"] = {
      vim.cmd.bnext,
      "Next buffer",
    },
    ["<S-Tab>"] = {
      vim.cmd.bprevious,
      "Previous buffer",
    },
  },
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
  t = {
    ["<Esc>"] = {
      "<C-\\><C-n>",
      "Enter Normal Mode",
    },
  },
  [{ "t", "i" }] = {
    ["<C-h>"] = {
      "<C-\\><C-n><C-w>h",
    },
    ["<C-l>"] = {
      "<C-\\><C-n><C-w>l",
    },
    ["<C-k>"] = {
      "<C-\\><C-n><C-w>k",
    },
    ["<C-j>"] = {
      "<C-\\><C-n><C-w>j",
    },
  },
}

M.unmappings = {
  n = {
    -- Buffers
    "<S-h>",
    "<S-l>",
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
    "<C-/>",
    "<C-_>",
  },
}

M.mapping_opts = {
  silent = true,
  noremap = true,
}

return M
