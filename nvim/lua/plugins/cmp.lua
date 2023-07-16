return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim",
		},
		event = "InsertEnter",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts = vim.tbl_deep_extend("keep", opts, {
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-u>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						end
					end, { "i", "s" }),
				}),
				sources = {},
				formatting = {
					format = {
						mode = "symbol",
						menu = {
							nvim_lsp = "(LSP) ",
							nvim_lsp_signature_help = "󰊕 ",
							vsnip = "(Snip) ",
							buffer = "(Buffer) ",
							path = "(Path) ",
						},
						maxwidth = 50,
						ellipsis_char = "…",
					},
				},
				experimental = {
					ghost_text = true,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				view = {
					entries = { name = "custom", selection_order = 'near_cursor' } -- can be "custom", "wildmenu" or "native"
				},
			})
			table.insert(opts.sources, { name = "nvim_lsp" })
			table.insert(opts.sources, { name = "nvim_lsp_signature_help" })
			table.insert(opts.sources, { name = "vsnip" })
			table.insert(opts.sources, { name = "buffer" })
			table.insert(opts.sources, { name = "path" })
			return opts
		end,
		config = function(_, opts)
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			cmp.setup(vim.tbl_deep_extend("force", opts, {
				sources = cmp.config.sources(opts.sources),
				formatting = {
					format = lspkind.cmp_format(opts.formatting.format),
				},
			}))
		end,
	},
}
