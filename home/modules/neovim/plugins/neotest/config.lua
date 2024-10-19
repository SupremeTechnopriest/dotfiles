local signs = { Failed = " ", Running = " ", Skipped = " ", Passed = " " }
for type, icon in pairs(signs) do
	local name = "neotest_" .. string.lower(type)
	local hl = "Neotest" .. type
	vim.fn.sign_define(name, { text = icon, texthl = hl, numhl = hl })
end
