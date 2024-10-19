local gitmoji = require("gitmoji")
gitmoji.setup({
	filetype = { "NeogitCommitMessage" },
	completion = {
		append_space = true,
		complete_as = "emoji",
	},
})

print(gitmoji)

require("cmp").register_source("gitmoji", gitmoji.get_source())
