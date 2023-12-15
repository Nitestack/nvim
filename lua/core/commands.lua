---@class CommandConfiguration
---@field auto_cmds AutoCommand[]
---@field auto_cmd_opts vim.api.keyset.create_autocmd
---@field user_cmds UserCommand[]
---@field user_cmd_opts vim.api.keyset.user_command
---@field au_groups AutoCommandGroup[]
---@field au_group_opts vim.api.keyset.create_augroup

---@type CommandConfiguration
---@diagnostic disable-next-line: missing-fields
local M = {}

M.auto_cmds = {
  -- show cursor line only in active window
  {
    { "InsertLeave", "WinEnter" },
    {
      callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
        if ok and cl then
          vim.wo.cursorline = true
          vim.api.nvim_win_del_var(0, "auto-cursorline")
        end
      end,
    },
  },
  {
    { "InsertEnter", "WinLeave" },
    {
      callback = function()
        local cl = vim.wo.cursorline
        if cl then
          vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
          vim.wo.cursorline = false
        end
      end,
    },
  },
  {
    "BufWritePre",
    {
      group = vim.api.nvim_create_augroup("better_backup", { clear = true }),
      callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        local backup = vim.fn.fnamemodify(file, ":p:~:h")
        if backup ~= nil then
          backup = backup:gsub("[/\\]", "%%")
          vim.go.backupext = backup
        end
      end,
    },
  },
  -- Fix conceallevel for json & help files
  {
    "FileType",
    {
      pattern = { "json", "jsonc" },
      callback = function()
        vim.wo.spell = false
        vim.wo.conceallevel = 0
      end,
    },
  },
}

M.auto_cmd_opts = {}

M.user_cmds = {}

M.user_cmd_opts = {}

M.au_groups = {}

M.au_group_opts = {}

return M
