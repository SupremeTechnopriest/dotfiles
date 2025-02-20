-- █▀▄ ▄▀█ █▀█
-- █▄▀ █▀█ █▀▀
-- Debug Adapter Protocol

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		require("dapui").setup()

		vim.fn.sign_define("DapBreakpoint", {
			text = "󰄯 ",
			texthl = "DiagnosticError",
			linehl = "DiffDelete",
		})
		vim.fn.sign_define("DapBreakpointCondition", {
			text = "󰯳 ",
			texthl = "DiagnosticError",
			linehl = "DiffDelete",
		})
		vim.fn.sign_define("DapLogPoint", {
			text = "󰰎 ",
			texthl = "DiagnosticDelete",
			linehl = "DiffDelete",
		})
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "󰍶 ",
			texthl = "DiagnosticWarn",
			linehl = "DiffChange",
		})
		vim.fn.sign_define("DapStopped", {
			text = "󰙧 ",
			texthl = "DiagnosticOk",
			linehl = "DiffAdd",
		})
	end,
}
