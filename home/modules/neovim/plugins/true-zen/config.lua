require("true-zen").setup({})

require("which-key").register({
	["<leader>z"] = { group = "Zen Mode" },
	["<leader>zn"] = { "<cmd>TZNarrow<CR>", "Narrow" },
	["<leader>zf"] = { "<cmd>TZFocus<CR>", "Focus" },
	["<leader>zm"] = { "<cmd>TZMinimalist<CR>", "Minimalist" },
	["<leader>za"] = { "<cmd>TZAtaraxis<CR>", "Ataraxis" },
})
