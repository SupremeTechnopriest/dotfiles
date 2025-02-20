-- █▀▀ █▀█ █░░ █▀█ █▀█ █ ▀█ █▀▀ █▀█
-- █▄▄ █▄█ █▄▄ █▄█ █▀▄ █ █▄ ██▄ █▀▄
-- Virtual Text Colorizer

return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "virtualtext",
			tailwind = "both",
			sass = { enable = true, parsers = { "css" } },
			virtualtext = "󱓻",
			virtualtext_inline = true,
			always_update = false,
		},
		buftypes = {},
	},
}
