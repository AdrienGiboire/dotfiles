vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- If the 'ignorecase' option is on, the case of normal letters is ignored.
-- 'smartcase' can be set to ignore case when the pattern contains lowercase
-- letters only.
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", eol = "¬", trail = "⌴" }

vim.opt.gdefault = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
