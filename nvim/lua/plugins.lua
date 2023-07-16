return {

	{ 'sainnhe/edge' },
	{ 'tpope/vim-commentary' },
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup() end
	},
	{ 'nvim-tree/nvim-tree.lua' },
	{ "rebelot/kanagawa.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "smartpde/neoscopes" },
	{
		"ipod825/libp.nvim",
		config = function()
			require("libp").setup()
		end,
	},
	{ "smartpde/tree-sitter-cpp-google" },

}
