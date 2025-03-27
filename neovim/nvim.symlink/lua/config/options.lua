local options = {
  number = true,
  showmatch = true,
  inccommand = "split",
  confirm = true,
  -- indent
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  smartindent = true,
  -- search
  incsearch = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  list = true, -- show whitespaces characters
  signcolumn = "yes",
  listchars = "trail:_,tab::.",
  cursorline = true,
  virtualedit = "block",
  wildignore = { "*/.git/*", "*/.hg/*", "*/.svn/*", "*/tags" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
--lua require("notify")("install ripgrep!")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
