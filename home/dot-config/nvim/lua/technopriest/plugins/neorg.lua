-- █▄░█ █▀▀ █▀█ █▀█ █▀▀
-- █░▀█ ██▄ █▄█ █▀▄ █▄█
-- Note Taking

return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = true,
	opts = {
		modules = {
			["core.defaults"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						personal = "~/Notes/personal",
						work = "~/Notes/work",
					},
				},
			},
		},
	},
}
