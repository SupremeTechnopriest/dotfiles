local disabled_line_decoration = { "dashboard", "oil", "notify", "mason" }
local disabled_animation = { "notify" }

local f = function(args)
	local ft = vim.bo[args.buf].filetype
	if vim.tbl_contains(disabled_line_decoration, ft) then
		vim.b[args.buf].minitrailspace_disable = true
		vim.b[args.buf].miniindentscope_disable = true
	end
	if vim.tbl_contains(disabled_animation, ft) then
		vim.b[args.buf].minianimate_disable = true
	end
end

vim.api.nvim_create_autocmd("Filetype", { callback = f })
