-- █▄░█ █▀▀ █▀█ ▀█▀ █▀▀ █▀ ▀█▀
-- █░▀█ ██▄ █▄█ ░█░ ██▄ ▄█ ░█░
-- Test Runner

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest"),
				require("neotest-vitest"),
			},
		})
	end,
}
