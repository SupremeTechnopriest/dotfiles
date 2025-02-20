-- █▀█ █ █░░
-- █▄█ █ █▄▄
-- File Browser

return {
	"stevearc/oil.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-p>"] = "actions.preview",
			["q"] = { "actions.close", mode = "n" },
			["r"] = { "actions.refresh", mode = "n" },
			["/"] = { "actions.parent", mode = "n" },
			["~"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["H"] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		columns = {
			"icons",
		},
		progress = {
			border = "none",
		},
		confirmation = {
			border = "none",
		},
	},
}
