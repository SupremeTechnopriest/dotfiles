local M = {}

function M.complete(filetype)
	return "typescript\njavascript\nlua\npython"
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_command('command! ScratchEval lua require("scratch.buffer").eval()')
	vim.api.nvim_command('command! ScratchNew lua require("scratch.buffer").create("<args>")')
end

return M
