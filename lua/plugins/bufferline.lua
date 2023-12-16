---@type LazyPluginSpec
return {
  "akinsho/bufferline.nvim",
  ---@param opts bufferline.UserConfig
  opts = function(_, opts)
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
    opts.options.right_mouse_command = "vert sbuffer %d"
    opts.options.indicator = opts.options.indicator or {}
    opts.options.indicator.icon = core.icons.ui.BoldLineLeft
    opts.options.buffer_close_icon = core.icons.ui.Close
    opts.options.modified_icon = core.icons.ui.Circle
    opts.options.close_icon = core.icons.ui.BoldClose
    opts.options.left_trunc_marker = core.icons.ui.ArrowCircleLeft
    opts.options.right_trunc_marker = core.icons.ui.ArrowCircleRight
    opts.options.diagnostics_update_in_insert = false
    opts.options.show_close_icon = false
    opts.options.always_show_bufferline = true
  end,
}
