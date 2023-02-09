local set = vim.opt

vim.cmd.colorscheme('gruvbox')

set.wildmenu = true

set.swapfile = false
set.backup = false
set.undodir = vim.fn.expand("~/.local/share/nvim/site/bullshit/undo/")
set.undofile = true

set.encoding = "utf-8"

set.tabstop = 4
set.expandtab = true
set.softtabstop= 4
set.shiftwidth= 4
set.smarttab = true
set.nu = true
set.rnu = true

set.scrolloff= 5
