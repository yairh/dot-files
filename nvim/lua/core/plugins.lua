local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'},     
  		{'nvim-treesitter/nvim-treesitter'},
		{'rinx/nvim-ripgrep'},
		{'nvim-telescope/telescope-symbols.nvim'}, 
		{'BurntSushi/ripgrep'},
		{'sharkdp/fd'},
 }
}
  use { "catppuccin/nvim", as = "catppuccin" }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use({'sainnhe/edge'})
  use ({"smartpde/telescope-recent-files"})

  use {'romgrk/barbar.nvim', requires = {
  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
}}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
