local M = {}

local enabled = false

function M.toggle()
	enabled = not enabled
	vim.api.nvim_exec_autocmds("User", {
		pattern = "HalmakToggle",
		data = { enabled = enabled },
	})
	print("Halmak " .. (enabled and "enabled" or "disabled"))
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
	vim.api.nvim_create_augroup("Halmak", { clear = true })
	vim.api.nvim_command('command! HalmakToggle lua require("halmak").toggle()')
	vim.api.nvim_exec_autocmds("User", {
		pattern = "HalmakToggle",
		data = { enabled = enabled },
	})
end

return M
