local M = {}

---@type vim.opt
M.options = {
  swapfile = false,
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  pumblend = 0,
  list = false,

  -- Shell
  shell = "pwsh",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

M.globals = {}

M.disabled_providers = { "perl", "ruby", "node", "python3" }

function M.run()
  -- go to previous/next line with h,l,left arrow and right arrow
  -- when cursor reaches end/beginning of line
  vim.opt.whichwrap:append("<>[]hl")
end

return M
