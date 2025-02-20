-- ▄▀█ █░█ ▄▀█ █▄░█ ▀█▀ █▀▀
-- █▀█ ▀▄▀ █▀█ █░▀█ ░█░ ██▄
-- AI Assistant

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		provider = "claude",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "o3-mini",
			timeout = 30000,
			temperature = 0,
			max_tokens = 4096,
			reasoning_effort = "high",
		},
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20241022",
			temperature = 0,
			max_tokens = 4096,
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"echasnovski/mini.icons",
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}
