-- █░░ █▀ █▀█
-- █▄▄ ▄█ █▀▀
-- Language Server Provider

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cairo_ls",
				"cssls",
				"dockerls",
				-- "go",
				"graphql",
				"helm_ls",
				"html",
				"htmx",
				-- hypr",
				"jsonls",
				"lua_ls",
				"shopify_theme_ls",
				-- "sql",
				"tailwindcss",
				"ts_ls",
				"yamlls",
				-- "prettierd",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"prettierd",
				"quick_lint_js",
				"markdownlint",
				"stylua",
			},
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5,
		})
	end,
}
