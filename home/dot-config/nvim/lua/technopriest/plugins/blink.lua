-- █▄▄ █░░ █ █▄░█ █▄▀   █▀▀ █▀▄▀█ █▀█
-- █▄█ █▄▄ █ █░▀█ █░█   █▄▄ █░▀░█ █▀▀
-- Autocomplete

return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			"petertriho/cmp-git",
			"Dynge/gitmoji.nvim",
			"echasnovski/mini.nvim",
			"Kaiser-Yang/blink-cmp-avante",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		version = "*",
		opts = {
			keymap = {
				preset = "super-tab",
			},

			completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
						},
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				ghost_text = { enabled = true },
			},

			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},

			snippets = { preset = "luasnip" },

			sources = {
				default = { "avante", "lsp", "path", "snippets", "buffer", "emoji" },
				per_filetype = {
					sql = { "lsp", "buffer", "vim-dadbod-completion" },
					pgsql = { "lsp", "buffer", "vim-dadbod-completion" },
					mysql = { "lsp", "buffer", "vim-dadbod-completion" },
					gitcommit = { "path", "git", "gitmoji" },
				},
				providers = {
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
					},
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
					},
					git = {
						name = "git",
						module = "blink.compat.source",
					},
					gitmoji = {
						name = "gitmoji",
						module = "blink.compat.source",
						opts = {
							filetypes = { "gitcommit" },
							completion = {
								append_space = true,
								complete_as = "emoji",
							},
						},
					},
					avante = {
						name = "Avante",
						module = "blink-cmp-avante",
						opts = {},
					},
				},
			},
		},

		opts_extend = { "sources.default" },
	},
}
