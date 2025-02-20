-- █▀▄▀█ ▄▀█ █▀█ █▄▀ █▀
-- █░▀░█ █▀█ █▀▄ █░█ ▄█
-- Mark Mappings

local marks = require("marks")
local harpoon = require("harpoon")

require("which-key").add({
	-- Marks
	{ "m", group = "Marks" },
	{ "ma", marks.set, desc = "Set mark" },
	{ "mA", marks.set_next, desc = "Set next mark" },
	{ "md", marks.delete, desc = "Delete mark" },
	{ "mD", marks.delete_line, desc = "Delete line marks" },
	{ "mx", marks.delete_buf, desc = "Delete buf marks" },
	{ "mn", marks.next, desc = "Next mark" },
	{ "mp", marks.prev, desc = "Previous mark" },
	{ "mX", "<cmd>delm! <bar> delm A-Z0-9<CR>", desc = "Delete all marks" },

	-- Harpoon
	{ "<leader>m", group = "Harpoon" },
	{
		"<leader>ma",
		function()
			harpoon:list():add()
		end,
		desc = "Harpoon add file",
	},
	{
		"<leader>mm",
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Harpoon quick menu",
	},
	{
		"<leader>mh",
		function()
			harpoon:list():prev()
		end,
		desc = "Previous",
	},
	{
		"<leader>ml",
		function()
			harpoon:list():next()
		end,
		desc = "Next",
	},
	{
		"<leader>m1",
		function()
			harpoon:list():select(1)
		end,
		desc = "Go to 1",
	},
	{
		"<leader>m2",
		function()
			harpoon:list():select(2)
		end,
		desc = "Go to 2",
	},
	{
		"<leader>m3",
		function()
			harpoon:list():select(3)
		end,
		desc = "Go to 3",
	},
	{
		"<leader>m4",
		function()
			harpoon:list():select(4)
		end,
		desc = "Go to 4",
	},
	{
		"<leader>m5",
		function()
			harpoon:list():select(5)
		end,
		desc = "Go to 5",
	},
	{
		"<leader>m6",
		function()
			harpoon:list():select(6)
		end,
		desc = "Go to 6",
	},
	{
		"<leader>m7",
		function()
			harpoon:list():select(7)
		end,
		desc = "Go to 7",
	},
	{
		"<leader>m8",
		function()
			harpoon:list():select(8)
		end,
		desc = "Go to 8",
	},
	{
		"<leader>m9",
		function()
			harpoon:list():select(9)
		end,
		desc = "Go to 9",
	},
})
