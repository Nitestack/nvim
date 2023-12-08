local M = {}

---@type vim.opt
M.options = {
  swapfile = false,
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  pumblend = 0,
  list = false,
}

M.globals = {}

M.disabled_providers = { "perl", "ruby", "node", "python3" }

function M.run()
  vim.cmd([[let &t_Cs = "\e[4:3m"]])
  vim.cmd([[let &t_Ce = "\e[4:0m"]])
  -- go to previous/next line with h,l,left arrow and right arrow
  -- when cursor reaches end/beginning of line
  vim.opt.whichwrap:append("<>[]hl")

  -- Windows
  if utils.general.is_win() then
    -- Shell
    vim.o.shell = "pwsh"
    vim.o.shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
  end

  -- Linux
  if utils.general.is_linux() then
    -- WSL Clipboard
    vim.g.clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
        ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
      },
      cache_enabled = 0,
    }
  end
end

return M
