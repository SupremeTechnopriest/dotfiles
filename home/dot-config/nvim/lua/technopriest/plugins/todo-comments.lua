-- ▀█▀ █▀█ █▀▄ █▀█   █▀▀ █▀█ █▀▄▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ █▀
-- ░█░ █▄█ █▄▀ █▄█   █▄▄ █▄█ █░▀░█ █░▀░█ ██▄ █░▀█ ░█░ ▄█
-- Todo Comment Renderer

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			FIX = {
				alt = {
					"FIXME",
					"FIXIT",
					"ISSUE",
					"BUG",
				},
				color = "error",
				icon = " ",
			},
			HACK = {
				color = "warning",
				icon = " ",
			},
			NOTE = {
				alt = {
					"INFO",
				},
				color = "hint",
				icon = " ",
			},
			PERF = {
				alt = {
					"OPTIM",
					"PERFORMANCE",
					"OPTIMIZE",
				},
				icon = " ",
			},
			TEST = {
				alt = {
					"TESTING",
					"PASSED",
					"FAILED",
				},
				color = "test",
				icon = " ",
			},
			TODO = {
				color = "info",
				icon = " ",
			},
			WARN = {
				alt = {
					"WARNING",
					"XXX",
				},
				color = "warning",
				icon = " ",
			},
		},
	},
}
