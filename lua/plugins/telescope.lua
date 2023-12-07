local LazyVimUtil = require("lazyvim.util")

---@type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  keys = core.lazy_map({
    n = {
      ["<leader>fw"] = {
        LazyVimUtil.telescope("live_grep"),
        "Grep (root dir)",
      },
      ["<leader>/"] = { false },
    },
  }),
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}
    opts.defaults.prompt_prefix = core.icons.ui.Telescope .. " "
    opts.defaults.sorting_strategy = "ascending"
    opts.defaults.layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = core.config.ui.width,
      height = core.config.ui.height,
      preview_cutoff = 120,
    }

    -- Load extensions
    opts.load_extensions = opts.load_extensions or {}
    for _, extension in ipairs(opts.load_extensions) do
      require("telescope").load_extension(extension)
    end
  end,
}
