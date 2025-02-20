-- █▀▀ █░█ █▀ ▀█▀ █▀█ █▀▄▀█   █▀█ █░░ █░█ █▀▀ █ █▄░█ █▀
-- █▄▄ █▄█ ▄█ ░█░ █▄█ █░▀░█   █▀▀ █▄▄ █▄█ █▄█ █ █░▀█ ▄█
-- My Custom Unpublished Plugins

return {
	{
		dir = vim.fn.stdpath("config") .. "/lua/technopriest/custom/scratch",
		name = "scratch",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("scratch").setup({})
			require("telescope").load_extension("scratch")
		end,
	},
	{
		dir = vim.fn.stdpath("config") .. "/lua/technopriest/custom/bigcomment",
		name = "bigcomment",
		opts = {},
	},
	{
		dir = vim.fn.stdpath("config") .. "/lua/technopriest/custom/halmak",
		name = "halmak",
		opts = {
			defaultEnabled = true,
		},
	},
}
