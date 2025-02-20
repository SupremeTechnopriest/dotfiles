-- █▀▀ █ █▄░█ █▀▄
-- █▀░ █ █░▀█ █▄▀
-- Find Things

local flash = require("flash")

require("which-key").add({
	{ "<leader>f", group = "Find" },
	{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Todos" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Git Files" },
	{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Search" },
	{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Marks" },
	{
		"s",
		function()
			flash.jump()
		end,
		desc = "Flash",
		mode = { "n", "x", "o" },
	},
	{
		"S",
		function()
			flash.treesitter()
		end,
		desc = "Flash Treesitter",
		mode = { "n", "x", "o" },
	},
	{
		"r",
		function()
			flash.remote()
		end,
		desc = "Flash Remote",
		mode = { "o" },
	},
	{
		"R",
		function()
			flash.treesitter_search()
		end,
		desc = "Treesitter Search",
		mode = { "o", "x" },
	},
	{
		"<c-s>",
		function()
			flash.toggle()
		end,
		desc = "Toggle Flash Search",
		mode = { "c" },
	},
})
