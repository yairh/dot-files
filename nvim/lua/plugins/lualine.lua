local config = function()
	-- special integration for fig workspace

	local function workspace()
		local file_path = vim.api.nvim_buf_get_name(0)
		local ws = require("neocitc").workspace_from_path(file_path)
		if not ws then return "" end
		return "[" .. ws .. "]"
	end
	local function get_cldesc()
		local desc = vim.api.nvim_eval([[
		substitute(system("hg figstatus | sed -n '5p;8p' | tr '\n' ' ' | cut -c1-40"), '\n\+$', '', '')  ]]
		)
		return desc
	end

	local function cldesc()
		local file_path = vim.api.nvim_buf_get_name(0)
		if not require("neocitc").workspace_from_path(file_path) then return "" end
		local desc = get_cldesc()
		if not desc then return "" end
		return " " .. desc
	end

	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { workspace, 'diff', 'diagnostics' },
			lualine_c = { 'filename' },
			lualine_x = { 'encoding', 'fileformat', 'filetype' },
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
end

return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			{ 'kyazdani42/nvim-web-devicons' },
			{ url = 'sso://googler@team/neovim-dev/neocitc' }
		},
		config = config
	},
}
