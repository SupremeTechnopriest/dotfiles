-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀
-- Window bindings

local oil = require("oil.actions")

local function isOil()
	return vim.bo.filetype == "oil"
end

require("which-key").add({
	{ "<leader>w", group = "Window" },

	-- Files (Oil)
	{ "<leader>wf", "<cmd>Oil<CR>", desc = "Todos" },

	-- Database
	{ "<leader>wd", "<cmd>DBUI<CR>", desc = "Database" },

	-- Diagnostics
	{ "<leader>wp", group = "Diagnostics" },
	{ "<leader>wpp", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Project" },
	{ "<leader>wpf", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Current file" },

	-- Todos
	{ "<leader>wt", "<cmd>TodoLocList<CR>", desc = "Todos" },
})
