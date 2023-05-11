-- requires 

require("core.mappings")
require("core.options")
-- packer setup need this line to find the right path 
vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
require("core.plugins")
require("core.colors")
