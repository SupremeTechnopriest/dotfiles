-- █▄▄ ▄▀█ █▀█ █▄▄ ▄▀█ █▀█
-- █▄█ █▀█ █▀▄ █▄█ █▀█ █▀▄
-- Buffer Bar
--
return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		animation = true,
		clickable = true,
		highlight_visible = true,
		insert_at_end = true,
		semantic_letters = true,
		tabpages = true,
		no_name_title = "No Name",
		focus_on_close = "previous",
	},
}
