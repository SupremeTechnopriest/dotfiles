-- █▀ █▀█ █░░ █ ▀█▀ █▀
-- ▄█ █▀▀ █▄▄ █ ░█░ ▄█

local halmak = require("halmak")

require("which-key").add({
	-- Make --
	{ "<C-v>", "<cmd>wincmd v<CR>", desc = "Split Vertical" },
	{ "<C-s>", "<cmd>wincmd s<CR>", desc = "Split Horizontal" },
	{ "<C-T>", "<cmd>wincmd T<CR>", desc = "Break out to new tab" },

	-- Resize --
	{ "<C-S-;>", "<cmd>wincmd =<CR>", desc = "Equal width and height" },

	-- Close --
	{ "<C-q>", "<cmd>q<CR>", desc = "Close split" },
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HalmakToggle",
	group = "Halmak",
	callback = function(args)
		require("which-key").add({
			-- Go to --
			{ "<C-h>", "<cmd>wincmd h<CR>", desc = "Go to left window", cond = halmak.disabled },
			{ "<C-l>", "<cmd>wincmd l<CR>", desc = "Go to right window", cond = halmak.disabled },
			{ "<C-j>", "<cmd>wincmd j<CR>", desc = "Go to down window", cond = halmak.disabled },
			{ "<C-k>", "<cmd>wincmd k<CR>", desc = "Go to up window", cond = halmak.disabled },

			{ "<C-a>", "<cmd>wincmd h<CR>", desc = "Go to left window", cond = halmak.enabled },
			{ "<C-i>", "<cmd>wincmd l<CR>", desc = "Go to right window", cond = halmak.enabled },
			{ "<C-e>", "<cmd>wincmd j<CR>", desc = "Go to down window", cond = halmak.enabled },
			{ "<C-o>", "<cmd>wincmd k<CR>", desc = "Go to up window", cond = halmak.enabled },

			-- Resize --
			{ "<C-S-h>", "<cmd>wincmd ><CR>", desc = "Increase width", cond = halmak.disabled },
			{ "<C-S-l>", "<cmd>wincmd <<CR>", desc = "Decrease width", cond = halmak.disabled },
			{ "<C-S-k>", "<cmd>wincmd +<CR>", desc = "Increase height", cond = halmak.disabled },
			{ "<C-S-j>", "<cmd>wincmd -<CR>", desc = "Decrease height", cond = halmak.disabled },

			{ "<C-S-a>", "<cmd>wincmd ><CR>", desc = "Increase width", cond = halmak.enabled },
			{ "<C-S-i>", "<cmd>wincmd <<CR>", desc = "Decrease width", cond = halmak.enabled },
			{ "<C-S-e>", "<cmd>wincmd +<CR>", desc = "Increase height", cond = halmak.enabled },
			{ "<C-S-o>", "<cmd>wincmd -<CR>", desc = "Decrease height", cond = halmak.enabled },
		})
	end,
})
