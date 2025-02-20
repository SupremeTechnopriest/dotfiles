-- █░░ █ █▄░█ █▀▀ █▀
-- █▄▄ █ █░▀█ ██▄ ▄█
-- Line manipulation

require("which-key").add({
	{ "J", "mzJ`z", desc = "Join lines", mode = "n" },
	{ "J", ":m '>+1<CR>gv=gv", desc = "Move lines down", mode = { "v" } },
	{ "K", ":m '<-2<CR>gv=gv", desc = "Move lines up", mode = { "v" } },
	{ "n", "nzzzv", desc = "Next search term", mode = "n" },
	{ "N", "Nzzzv", desc = "Previous search term", mode = "n" },
})
