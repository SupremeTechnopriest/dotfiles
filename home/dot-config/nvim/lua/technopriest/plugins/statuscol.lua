return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				-- Folding
				{
					click = "v:lua.ScFa",
					text = {
						" ",
						builtin.foldfunc,
						" ",
					},
				},
				-- Test
				{
					click = "v:lua.ScSa",
					sign = {
						name = {
							"neotest*",
						},
						maxwidth = 1,
						auto = true,
					},
				},
				-- Diagnostics and Todos
				{
					click = "v:lua.ScSa",
					sign = {
						name = {
							"todo*",
						},
						namespace = {
							"diagnostic/signs",
						},
						maxwidth = 1,
						auto = true,
					},
				},
				-- Dap
				{
					click = "v:lua.ScSa",
					sign = {
						name = {
							"Dap*",
						},
						maxwidth = 1,
						auto = true,
					},
				},
				-- Numbers
				{
					click = "v:lua.ScLa",
					text = {
						builtin.lnumfunc,
						" ",
					},
					maxwidth = 1,
					auto = true,
				},
				-- Marks
				{
					click = "v:lua.ScSa",
					sign = {
						name = {
							"Marks_*",
						},
						maxwidth = 1,
						auto = true,
					},
				},
				-- Gitsigns
				{
					click = "v:lua.ScSa",
					sign = {
						namespace = {
							"gitsigns",
						},
						maxwidth = 1,
						auto = true,
					},
				},
			},
		})
	end,
}
