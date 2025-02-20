-- █▀▄▀█ █▀█ █▀▄ █ █▀▀ ▄▀█ ▀█▀ █▀█ █▀█
-- █░▀░█ █▄█ █▄▀ █ █▄▄ █▀█ ░█░ █▄█ █▀▄
-- Cursor Line Mode Highlight

return {
	"mawkler/modicator.nvim",
	opts = {
		show_warnings = false,
		highlights = {
			defaults = {
				bold = true,
			},
		},
		integration = {
			lualine = {
				enabled = true,
				highlight = "bg",
			},
		},
	},
}
