-- █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▄▀█ ▄▀█ █▀█ █▄▀ █▀▄ █▀█ █░█░█ █▄░█
-- █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   █░▀░█ █▀█ █▀▄ █░█ █▄▀ █▄█ ▀▄▀▄▀ █░▀█
-- Markdown Renderer

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	opts = {
		file_types = {
			"markdown",
			"vimwiki",
			"Avante",
		},
		latex = {
			enabled = false,
		},
	},
	ft = {
		"markdown",
		"vimwiki",
		"Avante",
	},
}
