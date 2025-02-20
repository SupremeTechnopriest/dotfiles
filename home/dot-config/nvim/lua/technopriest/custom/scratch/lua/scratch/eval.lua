local eval = {}

function eval.lua(lines)
	local chunk = table.concat(lines, "\n")
	loadstring(chunk)()
end

function eval.python(lines)
	local chunk = table.concat(lines, "\\n")
	local exec = "python -c \"exec('" .. chunk .. "')\""
	vim.fn.jobstart(exec, {
		on_stdout = function(_, data)
			print(table.concat(data))
		end,
	})
end

function eval.javascript(lines)
	local chunk = table.concat(lines, "\\n")
	local exec = "bun -e \"eval('" .. chunk .. "')\""
	vim.fn.jobstart(exec, {
		on_stdout = function(_, data)
			print(table.concat(data))
		end,
	})
end

function eval.typescript(lines)
	local chunk = table.concat(lines, "\\n")
	local exec = "bun -e \"eval('" .. chunk .. "')\""
	print(exec)
	vim.fn.jobstart(exec, {
		on_stdout = function(_, data)
			print(table.concat(data))
		end,
	})
end

return eval
