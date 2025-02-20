-- █▀▄ █ ▄▀█ █▀▀ █▄░█ █▀█ █▀ ▀█▀ █ █▀▀ █▀
-- █▄▀ █ █▀█ █▄█ █░▀█ █▄█ ▄█ ░█░ █ █▄▄ ▄█
-- Diagnostics UI

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		options = {
			multilines = true,
		},
	},
}
