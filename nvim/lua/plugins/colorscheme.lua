return {
	{
		'projekt0n/github-nvim-theme',
		priority = 1000,
		lazy = false,
		tag = "v0.0.7",
		config = function(_, opts)
			vim.cmd.colorscheme("codedark")
			vim.cmd.colorscheme("github_dark_default")
		end
	},
	{ "olimorris/onedarkpro.nvim" },
	{
		'kunzaatko/nord.nvim',
		dependencies = { { 'rktjmp/lush.nvim' } }
	},
	{ 'tomasiser/vim-code-dark' },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "catppuccin/nvim" },
	{ 'marko-cerovac/material.nvim' }
}
