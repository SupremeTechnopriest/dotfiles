-- █░█░█ █░█ █ █▀▀ █░█   █▄▀ █▀▀ █▄█
-- ▀▄▀▄▀ █▀█ █ █▄▄ █▀█   █░█ ██▄ ░█░
-- Key Binding Hints

return {
	"folke/which-key.nvim",
	opts = {
		preset = "classic",
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				g = true,
				z = true,
				operators = true,
				text_objects = true,
				nav = true,
				motions = true,
			},
		},
	},
}
