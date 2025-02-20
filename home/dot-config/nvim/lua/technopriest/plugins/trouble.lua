-- ▀█▀ █▀█ █▀█ █░█ █▄▄ █░░ █▀▀
-- ░█░ █▀▄ █▄█ █▄█ █▄█ █▄▄ ██▄
-- Diagnostics

return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	init = function()
		local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
	opts = {
		position = "bottom",
	},
}
