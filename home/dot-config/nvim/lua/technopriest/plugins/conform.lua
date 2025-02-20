-- █▀▀ █▀█ █▄░█ █▀▀ █▀█ █▀█ █▀▄▀█
-- █▄▄ █▄█ █░▀█ █▀░ █▄█ █▀▄ █░▀░█
-- Formatter

return {
	"stevearc/conform.nvim",
	events = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettierd", "eslint_d" },
				javascript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				graphql = { "prettierd" },
			},
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
