-- █▄░█ █▀▀ █▀█ █▀▀ █▀█ █░░ █░█ █▀▄▀█ █▄░█
-- █░▀█ ██▄ █▄█ █▄▄ █▄█ █▄▄ █▄█ █░▀░█ █░▀█
-- Max width highlight

return {
	"ecthelionvi/NeoColumn.nvim",
	opts = {
		NeoColumn = "80",
		always_on = true,
	},
	ft = {
		"typescript",
		"javascript",
		"zig",
		"css",
		"scss",
		"lua",
	},
}
