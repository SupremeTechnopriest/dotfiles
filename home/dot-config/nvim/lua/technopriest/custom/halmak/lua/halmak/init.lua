local M = {}

local enabled = false

function M.toggle()
	enabled = enabled and false or true
	print("Halmak" .. enabled and "enabled" or "disabed")
end

function M.enabled()
	return enabled == true
end

function M.disabled()
	return enabled == false
end

function M.setup(opts)
	opts = opts or {}
	if opts.defaultEnabled then
		enabled = true
	end
	vim.api.nvim_command('command! HalmakToggle lua require("halmak").toggle()')
end

return M
