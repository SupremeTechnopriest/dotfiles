local utils = require("technopriest/theme/utils")

local integrations = {
	"blink",
	"telescope",
	"neogit",
	"noice",
	"notify",
	"which-key",
	"git",
	"diffview",
	"mason",
}

function refresh_theme()
	local theme = require("technopriest/theme/theme")
	for _, name in ipairs(integrations) do
		local highlights = require("technopriest/theme/integrations/" .. name)(theme, utils)
		for hlName, hlValue in pairs(highlights) do
			vim.api.nvim_set_hl(0, hlName, hlValue)
		end
	end
end

vim.api.nvim_create_user_command("RefreshTheme", function()
	refresh_theme()
	print("Theme Refreshed!")
end, { nargs = 0 })

vim.cmd([[colorscheme tokyonight-night]])

refresh_theme()
