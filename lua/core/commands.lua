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

M.auto_cmds = {}

M.auto_cmd_opts = {}

M.user_cmds = {}

M.user_cmd_opts = {}

M.au_groups = {}

M.au_group_opts = {}

return M
