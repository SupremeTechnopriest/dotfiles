-- ▀█ █▀▀ █▄░█
-- █▄ ██▄ █░▀█
-- True Zen and Twilight

return {
	"pocco81/true-zen.nvim",
	opts = {
		integrations = {
			twilight = true,
			lualine = true,
		},
	},
	dependencies = {
		{
			"folke/twilight.nvim",
			opts = {},
		},
	},
}
