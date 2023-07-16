vim.opt.autowrite = true -- save the file before leaving if changed
vim.opt.autowriteall = true
vim.opt.autoread = true  -- auto load file changes occured outside vim
-- Better editor UI
vim.opt.number = true
-- vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.cindent = true

vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂,eol:⁋'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.guifont = ""

vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.autoindent = true


-- completion options
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- clipboard
vim.opt.clipboard = "unnamed"
