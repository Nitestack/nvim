---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  ---@type MasonSettings
  opts = {
    ui = {
      border = core.config.ui.transparent.floats and "rounded" or "none",
      height = core.config.ui.height,
      width = core.config.ui.width,
      icons = {
        package_pending = core.icons.ui.PackagePending,
        package_installed = core.icons.ui.PackageInstalled,
        package_uninstalled = core.icons.ui.PackageUninstalled,
      },
    },
    pip = {
      upgrade_pip = true,
    },
  },
}
