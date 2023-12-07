---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  ---@type CatppuccinOptions
  opts = {
    transparent_background = core.config.ui.transparent.enabled,
    custom_highlights = function(C)
      local U = require("catppuccin.utils.colors")
      ---@type { [string]: CtpHighlight}
      local highlights = {}

      local darkening_percentage = 0.095

      if not core.config.ui.transparent.floats then
        ---@type { [string]: CtpHighlight}
        local float_highlights = {
          NormalFloat = { bg = C.mantle },
          Pmenu = { bg = U.darken(C.surface0, 0.8, C.crust) },

          NeoTreeNormal = { bg = C.mantle },
          NeoTreeNormalNC = { bg = C.mantle },
          NeoTreeVertSplit = { bg = C.base },

          DiagnosticVirtualTextError = {
            bg = U.darken(C.red, darkening_percentage, C.base),
          },
          DiagnosticVirtualTextWarn = {
            bg = U.darken(C.yellow, darkening_percentage, C.base),
          },
          DiagnosticVirtualTextInfo = {
            bg = U.darken(C.sky, darkening_percentage, C.base),
          },
          DiagnosticVirtualTextHint = {
            bg = U.darken(C.teal, darkening_percentage, C.base),
          },

          TelescopeBorder = {
            fg = C.mantle,
            bg = C.mantle,
          },
          TelescopeNormal = {
            bg = C.mantle,
          },
          TelescopePromptBorder = {
            fg = C.surface0,
            bg = C.surface0,
          },
          TelescopePromptNormal = {
            bg = C.surface0,
          },
          TelescopePromptPrefix = {
            bg = C.surface0,
          },
          TelescopePreviewTitle = {
            fg = C.base,
            bg = C.green,
          },
          TelescopePromptTitle = {
            fg = C.base,
            bg = C.red,
          },
          TelescopeResultsTitle = {
            fg = C.mantle,
            bg = C.lavender,
          },
          TelescopeSelection = {
            fg = C.text,
            bg = C.surface0,
          },
        }
        highlights = vim.tbl_deep_extend("force", highlights, float_highlights)
      end

      return highlights
    end,
    integrations = {
      dashboard = true,
      flash = true,
      gitsigns = true,
      harpoon = true,
      headlines = true,
      indent_blankline = {
        enabled = true,
      },
      markdown = true,
      mason = true,
      mini = {
        enabled = true,
      },
      neotree = true,
      noice = true,
      cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "bold" },
          hints = { "bold" },
          warnings = { "bold" },
          information = { "bold" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
        inlay_hints = {
          background = true,
        },
      },
      notify = true,
      treesitter_context = true,
      treesitter = true,
      rainbow_delimiters = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      lsp_trouble = true,
      illuminate = true,
      which_key = true,
    },
  },
}
