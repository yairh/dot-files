local config = function()
	local builtin = require('telescope.builtin')
	local map = vim.keymap.set

	-- telescope actions --
	local actions = require("telescope.actions")
	require("telescope").setup {
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close
				},
			},
			prompt_prefix = " ",
			selection_caret = " "
		},

		pickers = {
			find_files = {
				prompt_title = "  Find Files"
			},

			spell_suggest = {
				theme = "cursor",
				prompt_title = "󰣕 Spell Suggestion"
			}
		},
		extensions = {
		}
	}

	require("telescope").load_extension("recent_files")
	require("telescope").load_extension("file_browser")

	map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch [G]rep' })
	map('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
	map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	map('n', '<leader>sc', builtin.colorscheme, { desc = '[S]elect [C]olorchemes' })
	map('n', '<leader>rf', builtin.oldfiles, { desc = '[R]ecent [F]iles' })
	map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	map('n', '<leader>sy', builtin.treesitter, { desc = '[S]earch s[y]mbol' })
	map('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = '[F]ind in [B]uffer' })
	map('n', '<leader>h', ":Telescope file_browser<CR>", { noremap = true, desc = '[H]ome' })
	map('n', '<leader>fh', ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		{ noremap = true, desc = '[F]ind [H]ere' })
	map('n', '<leader>ss', builtin.spell_suggest, { noremap = true, desc = '[F]ind [H]ere' })

	vim.api.nvim_set_keymap("n", "<leader>rr",
		[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
		{ noremap = true, silent = true })
end


return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
			{ 'rinx/nvim-ripgrep' },
			{ 'nvim-telescope/telescope-symbols.nvim' },
			{ 'BurntSushi/ripgrep' },
			{ 'sharkdp/fd' },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "smartpde/telescope-recent-files" }
		},
		config = config
	}

}
