local opt = vim.opt

opt.number = true
opt.cursorline = true

local tabwidth = 4
opt.tabstop = tabwidth
opt.shiftwidth = tabwidth
opt.softtabstop = tabwidth
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.confirm = true

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 300
opt.autoread = true

opt.smoothscroll = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.completeopt = { "menuone", "noselect", "popup" }

-- TODO: only on linux
vim.g.clipboard = {
  name = 'WlClipboard',
  copy = {
    ['+'] = 'wl-copy',
    ['*'] = 'wl-copy',
  },
  paste = {
    ['+'] = 'wl-paste',
    ['*'] = 'wl-paste',
  },
  cache_enabled = 1,
}
