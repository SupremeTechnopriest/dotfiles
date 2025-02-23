-- █░█ ▀█▀ ▀█▀ █▀█   █▀▀ █░░ █ █▀▀ █▄░█ ▀█▀
-- █▀█ ░█░ ░█░ █▀▀   █▄▄ █▄▄ █ ██▄ █░▀█ ░█░
-- Kulala http controls

local kulala = require("kulala")

require("which-key").add({
	{ "<leader>h", group = "Http Client" },
	{
		"<leader>hb",
		function()
			kulala.scratchpad()
		end,
		group = "Open scratchpad",
	},
	{
		"<leader>ho",
		function()
			kulala.open()
		end,
		group = "Open Client",
	},
})

vim.api.nvim_create_autocmd("Filetype", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local fts = { "http", "rest" }
		local enabled = function()
			return vim.tbl_contains(fts, ft) and true or false
		end

		require("which-key").add({
			{
				"<leader>ht",
				function()
					kulala.toggle_view()
				end,
				group = "Toggle headers/body",
				cond = enabled,
			},
			{
				"<leader>hS",
				function()
					kulala.show_stats()
				end,
				group = "Show stats",
				cond = enabled,
			},
			{
				"<leader>hq",
				function()
					kulala.close()
				end,
				group = "Close",
				cond = enabled,
			},
			{
				"<leader>hc",
				function()
					kulala.copy()
				end,
				group = "Copy as curl",
				cond = enabled,
			},
			{
				"<leader>hv",
				function()
					kulala.from_curl()
				end,
				group = "Paste from curl",
				cond = enabled,
			},
			{
				"<leader>hs",
				function()
					kulala.run()
				end,
				group = "Send request",
				cond = enabled,
			},
			{
				"<CR>",
				function()
					kulala.run()
				end,
				group = "Send request",
				cond = enabled,
			},
			{
				"<leader>ha",
				function()
					kulala.run_all()
				end,
				group = "Send all requests",
				cond = enabled,
			},
			{
				"<leader>hi",
				function()
					kulala.inspect()
				end,
				group = "Inspect current request",
				cond = enabled,
			},
			{
				"<leader>hr",
				function()
					kulala.replay()
				end,
				group = "Replay last request",
				cond = enabled,
			},
			{
				"<leader>hf",
				function()
					kulala.search()
				end,
				group = "Find request",
				cond = enabled,
			},
			{
				"<leader>hn",
				function()
					kulala.jump_next()
				end,
				group = "Jump to next request",
				cond = enabled,
			},
			{
				"<leader>hp",
				function()
					kulala.jump_prev()
				end,
				group = "Jump to previous request",
				cond = enabled,
			},
			{
				"<leader>he",
				function()
					kulala.set_selected_env()
				end,
				group = "Select environment",
				cond = enabled,
			},
			{
				"<leader>hg",
				function()
					kulala.download_graphql_schema()
				end,
				group = "Download GraphQL schema",
				cond = enabled,
			},
			{
				"<leader>hx",
				function()
					kulala.scripts_clear_global()
				end,
				group = "Clear globals",
				cond = enabled,
			},
			{
				"<leader>hX",
				function()
					kulala.clear_cached_files()
				end,
				group = "Clear cached files",
				cond = enabled,
			},
		})
	end,
})
