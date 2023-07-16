local config = function()
	vim.notify = require("notify")

	require("notify").setup({
		render = "minimal",
		timeout = 3000,
	})
end
return {
	{ "MunifTanjim/nui.nvim", config = config }
}
