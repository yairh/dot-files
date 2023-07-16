vim.g.mapleader = " " -- leader key is space
vim.g.localleader = " "
local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'i' }, '<C-a>', "<C-w>h", opts)  -- switch pane left
vim.keymap.set({ 'n', 'i' }, '<C-s>', "<C-w>l", opts)  -- switch pane right
vim.keymap.set({ 'n', 'i' }, '<C-x>', "<C-w>j", opts)  -- switch pane bottom
vim.keymap.set({ 'n', 'i' }, '<C-w>', "<C-w>w", opts)  -- switch pane top
vim.keymap.set({ 'n' }, '<leader>w', ":w<CR>")         -- save file in normal mode
vim.keymap.set({ 'n', 'i' }, '<C-d>', "<C-d>zz", opts) -- half page down + centers cursor
vim.keymap.set({ 'n', 'i' }, '<C-u>', '<C-u>zz', opts) -- half page down + centers cursor
