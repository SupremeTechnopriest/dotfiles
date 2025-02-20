-- █▀▀ █ ▀█▀
-- █▄█ █ ░█░
-- Git Bindings

require("which-key").add({
	{ "<leader>g", group = "Git" },
	{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Branch" },
	{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
	{ "<leader>gh", "<cmd>Telescope git_commits<CR>", desc = "History" },
	{ "<leader>gH", "<cmd>Telescope git_bcommits<CR>", desc = "Buffer history" },
	{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diff" },
	{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Interface" },
})
