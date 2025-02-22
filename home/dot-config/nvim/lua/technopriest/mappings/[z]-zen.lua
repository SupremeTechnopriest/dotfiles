require("which-key").add({
	{ "<leader>z", group = "Zen" },
	{ "<leader>zz", "<cmd>lua Snacks.zen()<CR>", desc = "Zen" },
	{ "<leader>za", "<cmd>TZAtaraxis<CR>", desc = "Ataraxis" },
	{ "<leader>zn", "<cmd>TZNarrow<CR>", desc = "Narrow" },
	{ "<leader>zf", "<cmd>TZFocus<CR>", desc = "Focus" },
	{ "<leader>zm", "<cmd>TZMinimalist<CR>", desc = "Minimalist" },
	{ "<leader>zt", "<cmd>Twilight<CR>", desc = "Dim" },
})
