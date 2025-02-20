require("which-key").add({
	{ "<leader>z", group = "Zen" },
	{ "<leader>zz", "<cmd>lua Snacks.zen()<CR>", desc = "Atarxis" },
	{ "<leader>za", "<cmd>TZAtarxis<CR>", desc = "Atarxis" },
	{ "<leader>zn", "<cmd>TZNarrow<CR>", desc = "Narrow" },
	{ "<leader>zf", "<cmd>TZFocus<CR>", desc = "Focus" },
	{ "<leader>zm", "<cmd>TZMinimalist<CR>", desc = "Minimalist" },
	{ "<leader>zt", "<cmd>Twilight<CR>", desc = "Dim" },
})
