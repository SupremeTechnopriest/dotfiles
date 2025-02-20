-- █▀█ ▀█▀ █░█ █▀▀ █▀█
-- █▄█ ░█░ █▀█ ██▄ █▀▄
-- Other File Switcher

return {
	"rgroli/other.nvim",
	config = function()
		require("other-nvim").setup({
			mappings = {
				{
					pattern = "src/(.*)/(.*).ts",
					target = "test/$1/$2.test.ts",
				},
			},
		})
	end,
}
