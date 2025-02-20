-- █░░ █▀ █▀█
-- █▄▄ ▄█ █▀▀
-- Language Server Protocol

local lint = require("lint")
local wk = require("which-key")
local conform = require("conform")
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

wk.add({
	{ ".", ts_repeat_move.repeat_last_move_next, desc = "Repeat move next", mode = { "n", "x", "o" } },
	{ ",", ts_repeat_move.repeat_last_move_prev, desc = "Repeat move prev", mode = { "n", "x", "o" } },
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		wk.add({
			{ "K", vim.lsp.buf.hover, desc = "LSP Hover", buffer = event.buf },
			{ "g", group = "Go to" },
			{ "gd", vim.lsp.buf.definition, desc = "Go to definition", buffer = event.buf },
			{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration", buffer = event.buf },
			{ "gi", vim.lsp.buf.implementation, desc = "Go to implementation", buffer = event.buf },
			{ "gt", vim.lsp.buf.implementation, desc = "Go to type definition", buffer = event.buf },
			{ "gr", vim.lsp.buf.references, desc = "Go to references", buffer = event.buf },
			{ "gs", vim.lsp.buf.signature_help, desc = "Go to signature", buffer = event.buf },
			{ "gp", vim.diagnostic.open_float, desc = "Open diagnostic float", buffer = event.buf },
			{ "go", group = "Go to Alternate" },
			{ "got", "<cmd>A<CR>", desc = "Toggle alternate" },
			{ "goh", "<cmd>AS<CR>", desc = "Horizontal split alternate" },
			{ "gov", "<cmd>AV<CR>", desc = "Vertical split alternate" },
			{ "gon", "<cmd>AT<CR>", desc = "New tab alternate" },
			{ "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic", buffer = event.buf },
			{ "]d", vim.diagnostic.goto_next, desc = "Next diagnostic", buffer = event.buf },
			{ "<leader>a", vim.lsp.buf.code_action, desc = "Code action", buffer = event.buf },
			{ "<leader>l", lint.try_lint, desc = "Lint", buffer = event.buf },
			{
				"<leader>p",
				function()
					conform.format({
						async = false,
						lsp_fallback = true,
						timeout_ms = 1000,
					})
				end,
				desc = "Format",
				buffer = event.buf,
			},
		})
	end,
})
