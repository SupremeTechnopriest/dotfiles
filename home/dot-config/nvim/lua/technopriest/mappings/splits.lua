-- █▀ █▀█ █░░ █ ▀█▀ █▀
-- ▄█ █▀▀ █▄▄ █ ░█░ ▄█

local halmak = require("halmak")

require("which-key").add({
	-- Make --
	{ "<C-v>", "<cmd>wincmd v<CR>", desc = "Split Vertical" },
	{ "<C-s>", "<cmd>wincmd s<CR>", desc = "Split Horizontal" },
	{ "<C-T>", "<cmd>wincmd T<CR>", desc = "Break out to new tab" },
	-- Go to --
	{ "<C-h>", "<cmd>wincmd h<CR>", desc = "Go to left window", cond = halmak.disabled },
	{ "<C-l>", "<cmd>wincmd l<CR>", desc = "Go to right window", cond = halmak.disabled },
	{ "<C-j>", "<cmd>wincmd j<CR>", desc = "Go to down window", cond = halmak.disabled },
	{ "<C-k>", "<cmd>wincmd k<CR>", desc = "Go to up window", cond = halmak.disabled },

	{ "<C-h>", "<cmd>wincmd a<CR>", desc = "Go to left window", cond = halmak.enabled },
	{ "<C-l>", "<cmd>wincmd e<CR>", desc = "Go to right window", cond = halmak.enabled },
	{ "<C-j>", "<cmd>wincmd o<CR>", desc = "Go to down window", cond = halmak.enabled },
	{ "<C-k>", "<cmd>wincmd i<CR>", desc = "Go to up window", cond = halmak.enabled },

	-- Resize --
	{ "<C-S-l>", "<cmd>wincmd ><CR>", desc = "Increase width" },
	{ "<C-S-h>", "<cmd>wincmd <<CR>", desc = "Decrease width" },
	{ "<C-S-k>", "<cmd>wincmd +<CR>", desc = "Increase height" },
	{ "<C-S-j>", "<cmd>wincmd -<CR>", desc = "Decrease height" },
	{ "<C-S-e>", "<cmd>wincmd =<CR>", desc = "Equal width and height" },

	-- Close --
	{ "<leader><leader>q", "<cmd>q<CR>", desc = "Close split" },
})
