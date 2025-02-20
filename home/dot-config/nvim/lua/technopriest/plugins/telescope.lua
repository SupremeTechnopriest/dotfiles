-- ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀
-- ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄
-- Picker

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	event = "VeryLazy",
	opts = {
		defaults = {
			prompt_prefix = "   ",
			selection_caret = " ",
			entry_prefix = " ",
			sorting_strategy = "ascending",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				width = 0.87,
				height = 0.80,
			},
		},
		extensions = {
			media_files = {
				filetypes = {
					"png",
					"jpg",
					"jpeg",
					"webp",
					"svg",
					"mp4",
					"ttf",
					"otf",
					"woff",
				},
				find_cmd = "rg",
			},
			file_browser = {},
			fzf = {
				fuzzy = true,
			},
		},
	},
}
