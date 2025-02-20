-- █▄░█ █▀█ █ █▀▀ █▀▀
-- █░▀█ █▄█ █ █▄▄ ██▄
-- Pretty UI

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["cmp.entry.get_documentation"] = true,
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			bottom_search = false,
			inc_rename = false,
			long_message_to_split = true,
			lsp_doc_border = false,
		},
		lsp = {
			documentation = {
				opts = {
					relative = "cursor",
					position = {
						row = 2,
						col = 0,
					},
					border = {
						padding = { 1, 2 },
					},
				},
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				border = {
					style = "solid",
					padding = { 0, 0 },
				},
				filter_options = {},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "solid",
					padding = { 0, 1 },
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
