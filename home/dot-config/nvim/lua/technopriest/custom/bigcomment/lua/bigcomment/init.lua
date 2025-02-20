local M = {}

M.bigcomment = require("bigcomment.bigcomment").bigcomment

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_command('command! BigComment lua require("bigcomment.bigcomment").bigcomment()')
end

return M
