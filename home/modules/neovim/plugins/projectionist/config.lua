local default_projections = {
	javascript = {
		["src/*.js"] = { alternate = "tests/{}.test.js" },
		["tests/*.test.js"] = { alternate = "src/{}.js" },
	},
	typescript = {
		["src/*.ts"] = { alternate = "tests/{}.test.ts" },
		["tests/*.test.ts"] = { alternate = "src/{}.ts" },
	},
	javascriptreact = {
		["src/*.jsx"] = { alternate = "tests/{}.test.jsx" },
		["tests/*.test.jsx"] = { alternate = "src/{}.jsx" },
	},
	typescriptreact = {
		["src/*.tsx"] = { alternate = "tests/{}.test.tsx" },
		["tests/*.test.tsx"] = { alternate = "src/{}.tsx" },
	},
	zig = {
		["src/*.zig"] = { alternate = "tests/{}.test.zig" },
		["tests/*.test.zig"] = { alternate = "src/{}.zig" },
	},
}

vim.api.nvim_create_autocmd("User", {
	pattern = "ProjectionistDetect",
	callback = function()
		local projections = default_projections[vim.bo.filetype]
		if projections ~= nil then
			vim.call["projectionist#append"](vim.call["projectionist#root"](), projections)
		end
	end,
})
