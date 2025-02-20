-- ▀█▀ █▀▀ █▀▄▀█ █▀█ █░░ ▄▀█ ▀█▀ █▀▀   █▀ ▀█▀ █▀█ █ █▄░█ █▀▀
-- ░█░ ██▄ █░▀░█ █▀▀ █▄▄ █▀█ ░█░ ██▄   ▄█ ░█░ █▀▄ █ █░▀█ █▄█
-- Automatic Template Strings

return {
	"axelvc/template-string.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	events = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		require("template-string").setup({
			filetypes = {
				"html",
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			},
			jsx_brackets = true,
			remove_template_string = true,
			restore_quotes = {
				normal = [[']],
				jsx = [[']],
			},
		})
	end,
}
