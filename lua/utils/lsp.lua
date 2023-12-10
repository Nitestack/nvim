local M = {}

---@alias StringOrArray string|string[]

---@param str_or_arr StringOrArray
local function resolve_str_or_arr(str_or_arr)
  if type(str_or_arr) == "string" then
    return { str_or_arr }
  end
  return str_or_arr
end

---@class LanguageConfig
---@field lsp? LanguageLspConfig
---@field mason? StringOrArray
---@field treesitter? StringOrArray
---@field formatter? LanguageFormatterConfig
---@field linter? LanguageLinterConfig
---@field plugins? LazyPluginSpec[]

---@class LanguageLspConfig
---@field servers? table<string, table>
---@field setup? table<string, fun(server:string, opts:_.lspconfig.options):boolean?>

---@class LanguageFormatterConfig
---@field formatters_by_ft? table<string, conform.FormatterUnit[]>
---@field formatters? table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>

---@class LanguageLinterConfig
---@field linters_by_ft? table<string, string[]>
---@field linters? table<string,table>

---@param config LanguageConfig
function M.load_language(config)
  ---@type LazyPluginSpec[]
  local spec = {}

  if config.lsp then
    table.insert(spec, {
      "neovim/nvim-lspconfig",
      ---@type PluginLspOpts
      opts = {
        setup = config.lsp.setup or {},
        servers = config.lsp.servers or {},
      },
    })
  end

  if config.mason then
    table.insert(spec, {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, resolve_str_or_arr(config.mason))
      end,
    })
  end

  if config.treesitter then
    table.insert(spec, {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, resolve_str_or_arr(config.treesitter))
      end,
    })
  end

  if config.formatter then
    table.insert(spec, {
      "stevearc/conform.nvim",
      opts = function(_, opts)
        if config.formatter.formatters_by_ft then
          opts.formatters_by_ft =
            vim.tbl_extend("force", opts.formatters_by_ft or {}, config.formatter.formatters_by_ft)
        end
        if config.formatter.formatters then
          opts.formatters = vim.tbl_extend("force", opts.formatters or {}, config.formatter.formatters)
        end
      end,
    })
  end

  if config.linter then
    table.insert(spec, {
      "mfussenegger/nvim-lint",
      opts = function(_, opts)
        if config.linter.linters_by_ft then
          opts.linters_by_ft = vim.tbl_extend("force", opts.linters_by_ft or {}, config.linter.linters_by_ft)
        end
        if config.linter.linters then
          opts.linters = vim.tbl_extend("force", opts.linters or {}, config.linter.linters)
        end
      end,
    })
  end

  if config.plugins then
    vim.list_extend(spec, config.plugins)
  end

  return spec
end

return M
