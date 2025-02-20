-- █▀█ █░█ █▄░█
-- █▀▄ █▄█ █░▀█
-- Run Things

require("which-key").add({
	{ "<leader>R", group = "Run" },
	{ "<leader>Rt", group = "Run Test" },
	{ "<leader>Rtf", "<cmd>Neotest run<CR>", group = "Under Cursor" },
	{ "<leader>Rtc", "<cmd>Neotest run file<CR>", group = "Current File" },
	{ "<leader>Rtl", "<cmd>Neotest run last<CR>", group = "Last" },
	{ "<leader>Rs", "<cmd>ScratchEval<CR>", desc = "Run Scratch" },
})
