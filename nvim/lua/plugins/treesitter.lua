local config = function()
	require 'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "cpp", "go", "regex", "bash", "markdown_inline" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		autotag = { enable = true },
		endwise = { enable = true }
	}
	require("tree-sitter-cpp-google").setup()
end
return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = config,
		dependencies = { "smartpde/tree-sitter-cpp-google" }
	},
}
