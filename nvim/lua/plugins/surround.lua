return {
	{
		"kylechui/nvim-surround",
		config = true,
		keys = {
			{ "ys", desc = "Add surround" },
			{ "cs", desc = "Change surround" },
			{ "ds", desc = "Delete surround" },
			{
				"S",
				mode = "v",
				desc = "Add surround to selection"
			},
			{
				"<c-g>s",
				mode = "i",
				desc = "Add surround"
			},
		},
	},
}
