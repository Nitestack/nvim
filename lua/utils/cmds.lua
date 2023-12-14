local M = {}

---@param opts vim.api.keyset.create_autocmd
local function ensure_au_group_defined(opts)
  if type(opts.group) == "string" and opts.group ~= "" then
    local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
    if not exists then
      vim.api.nvim_create_augroup(opts.group, {})
    end
  end
end

---@class AutoCommand
---@field [1] string|string[]
---@field [2]? vim.api.keyset.create_autocmd

---@param auto_cmds AutoCommand|AutoCommand[]
---@param auto_cmd_opts? vim.api.keyset.create_autocmd
function M.auto_cmds(auto_cmds, auto_cmd_opts)
  if vim.tbl_isarray(auto_cmds) then
    for _, auto_cmd in ipairs(auto_cmds) do
      local opts =
        vim.tbl_deep_extend("force", auto_cmd_opts or {}, auto_cmd[2] --[[@as vim.api.keyset.create_autocmd]] or {})
      ensure_au_group_defined(opts or {})
      vim.api.nvim_create_autocmd(auto_cmd[1], opts)
    end
  else
    local opts =
      vim.tbl_deep_extend("force", auto_cmd_opts or {}, auto_cmds[2] --[[@as vim.api.keyset.create_autocmd]] or {})
    ensure_au_group_defined(opts or {})
    vim.api.nvim_create_autocmd(auto_cmds[1], opts)
  end
end

---@class UserCommand
---@field [1] string
---@field [2] any
---@field [3]? vim.api.keyset.user_command

---@param user_cmds UserCommand|UserCommand[]
---@param user_cmd_opts? vim.api.keyset.user_command
function M.user_cmds(user_cmds, user_cmd_opts)
  if vim.tbl_isarray(user_cmds) then
    for _, user_cmd in ipairs(user_cmds) do
      local opts =
        vim.tbl_deep_extend("force", user_cmd_opts or {}, user_cmd[3] --[[@as vim.api.keyset.user_command]] or {})
      vim.api.nvim_create_user_command(user_cmd[1], user_cmd[2], opts)
    end
  else
    local opts =
      vim.tbl_deep_extend("force", user_cmd_opts or {}, user_cmds[3] --[[@as vim.api.keyset.user_command]] or {})
    vim.api.nvim_create_user_command(user_cmds[1] --[[@as string]], user_cmds[2], opts)
  end
end

---@class AutoCommandGroupSpec
---@field [1] string
---@field [2]? vim.api.keyset.create_augroup

---@alias AutoCommandGroup string|AutoCommandGroupSpec

---@param au_groups AutoCommandGroup|AutoCommandGroup[]
---@param au_group_opts? vim.api.keyset.create_augroup
function M.au_groups(au_groups, au_group_opts)
  if type(au_groups) == "string" then
    vim.api.nvim_create_augroup(au_groups, au_group_opts or {})
  elseif vim.tbl_isarray(au_groups) then
    for _, au_group in ipairs(au_groups) do
      if type(au_group) == "string" then
        vim.api.nvim_create_augroup(au_group, au_group_opts or {})
      else
        local opts =
          vim.tbl_deep_extend("force", au_group_opts or {}, au_group[2] --[[@as vim.api.keyset.create_augroup]] or {})
        vim.api.nvim_create_augroup(au_group[1], opts)
      end
    end
  else
    local opts =
      vim.tbl_deep_extend("force", au_group_opts or {}, au_groups[2] --[[@as vim.api.keyset.create_augroup]] or {})
    vim.api.nvim_create_augroup(au_groups[1] --[[@as string]], opts)
  end
end

return M
