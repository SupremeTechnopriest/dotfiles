-- █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
-- █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄
-- General Mappings

require("which-key").add({
	{ "Q", "<nop>", mode = { "n" }, hidden = true },
	{ "<C-c>", "<Esc>", mode = { "i" }, hidden = true },
	{ "<leader>s", "<cmd>w<CR>", desc = "Save" },
	{ "<leader>d", '"_d', desc = "Delete preserve", mode = { "n", "v" } },
	{ "<leader>y", '"+y', desc = "System copy before", mode = { "n", "v" } },
	{ "<leader>Y", '"+Y', desc = "System copy after", mode = { "n", "v" } },
	{ "<leader>p", '"+p', desc = "System paste before", mode = { "n", "v" } },
	{ "<leader>P", '"+P', desc = "System paste after", mode = { "n", "v" } },
	{ "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], desc = "Replace word", mode = { "n", "v" } },
	{ "<leader>x", "<cmd>!chmod +x %<CR>", desc = "Make executable", { silent = true } },
	{ "<leader>J", "mzJ`z", desc = "Join lines" },
	{ "<leader>J", ":m '>+1<CR>gv=gv", desc = "Move lines down", mode = { "v" } },
	{ "<leader>K", ":m '<-2<CR>gv=gv", desc = "Move lines up", mode = { "v" } },
	{ "<leader>n", "nzzzv", desc = "Next search term" },
	{ "<leader>N", "Nzzzv", desc = "Previous search term" },
})
