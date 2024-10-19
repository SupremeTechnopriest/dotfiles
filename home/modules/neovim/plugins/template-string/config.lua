require("template-string").setup({
	filetypes = {
		"html",
		"markdown",
		"typescript",
		"javascript",
		"typescriptreact",
		"javascriptreact",
	},
	jsx_brackets = true,
	remove_template_string = true,
	restore_quotes = {
		normal = [[']],
		jsx = [[']],
	},
})
