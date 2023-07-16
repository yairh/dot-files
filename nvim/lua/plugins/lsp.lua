return
{
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
	-- LSP for neovim configuration and development
	{
		"folke/neodev.nvim",
		ft = "lua",
		opts = { pathStrict = true },
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		event = { "BufRead", "BufNewFile" },
		opts = {
			servers = {
				lua_ls = {},
				bashls = {},
			},
			format = {
				servers = {
					lua_ls = { "lua" },
				},
			},
		},
		config = function(_, opts)
			local lsp = require("lsp-zero").preset({
				name = "minimal",
				set_lsp_keymaps = false,
				manage_nvim_cmp = false,
				setup_servers_on_start = false,
			})
			lsp.set_sign_icons({
				error = "",
				warn = "",
				hint = "",
				info = ""
			})

			lsp.on_attach(function(client, bufnr)
					lsp.default_keymaps(opts)
				local options = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
			end)
			lsp.format_on_save(opts.format)
			local lspconfig = require("lspconfig")
			for server_name, server_opts in pairs(opts.servers) do
				lspconfig[server_name].setup(server_opts)
			end
			lsp.setup()
		end
	}
}
