-- █▄░█ █▀▀ █▀█ █▀▀ █ ▀█▀
-- █░▀█ ██▄ █▄█ █▄█ █ ░█░
-- Git manager

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	opts = {
		signs = {
			hunk = { "", "" },
			item = { "", "" },
			section = { "", "" },
		},
		integrations = {
			diffview = true,
			telescope = true,
		},
	},
	config = true,
}
