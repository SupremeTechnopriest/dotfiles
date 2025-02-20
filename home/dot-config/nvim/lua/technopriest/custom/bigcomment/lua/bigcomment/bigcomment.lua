local M = {}

---Common commentstring shared by multiple languages
---@type table<string,string>
local C = {
	cxx_l = "//%s",
	cxx_b = "/*%s*/",
	dbl_hash = "##%s",
	dash = "--%s",
	dash_bracket = "--[[%s]]",
	handlebars = "{{!--%s--}}",
	hash = "#%s",
	hash_bracket = "#[[%s]]",
	haskell_b = "{-%s-}",
	fsharp_b = "(*%s*)",
	html = "<!--%s-->",
	latex = "%%s",
	semicolon = ";%s",
	lisp_l = ";;%s",
	lisp_b = "#|%s|#",
	twig = "{#%s#}",
	vim = '"%s',
	lean_b = "/-%s-/",
}

---Lang table that contains commentstring for multiple filetypes
---Structure = { filetype = linewise }
---@type table<string,string>
local L = setmetatable({
	arduino = C.cxx_l,
	applescript = C.hash,
	astro = C.html,
	autohotkey = C.semicolon,
	bash = C.hash,
	beancount = C.semicolon,
	bib = C.latex,
	c = C.cxx_l,
	cabal = C.dash,
	cmake = C.hash,
	conf = C.hash,
	conkyrc = C.dash,
	coq = C.fsharp_b,
	cpp = C.cxx_l,
	cs = C.cxx_l,
	css = C.cxx_b,
	cuda = C.cxx_l,
	dart = C.cxx_l,
	dhall = C.dash,
	dosbatch = "REM%s",
	dot = C.cxx_l,
	dts = C.cxx_l,
	editorconfig = C.hash,
	eelixir = C.html,
	elixir = C.hash,
	elm = C.dash,
	elvish = C.hash,
	faust = C.cxx_l,
	fennel = C.semicolon,
	fish = C.hash,
	func = C.lisp_l,
	fsharp = C.cxx_l,
	gdb = C.hash,
	gdscript = C.hash,
	gitignore = C.hash,
	gleam = C.cxx_l,
	glsl = C.cxx_l,
	gnuplot = C.hash,
	go = C.cxx_l,
	gomod = C.cxx_l,
	graphql = C.hash,
	groovy = C.cxx_l,
	handlebars = C.handlebars,
	haskell = C.dash,
	haxe = C.cxx_l,
	heex = C.html,
	html = C.html,
	htmldjango = C.html,
	idris = C.dash,
	idris2 = C.dash,
	ini = C.hash,
	java = C.cxx_l,
	javascript = C.cxx_l,
	javascriptreact = C.cxx_l,
	jsonc = C.cxx_l,
	jsonnet = C.cxx_l,
	julia = C.hash,
	kotlin = C.cxx_l,
	lean = C.dash,
	lean3 = C.dash,
	lidris = C.dash,
	lilypond = C.latex,
	lisp = C.lisp_l,
	lua = C.dash,
	luau = C.dash,
	markdown = C.html,
	make = C.hash,
	mbsyncrc = C.dbl_hash,
	mermaid = "%%%s",
	meson = C.hash,
	nextflow = C.cxx_l,
	nim = C.hash,
	nix = C.hash,
	nu = C.hash,
	ocaml = C.fsharp_b,
	odin = C.cxx_l,
	plantuml = "'%s",
	purescript = C.dash,
	python = C.hash,
	php = C.cxx_l,
	prisma = C.cxx_l,
	proto = C.cxx_l,
	quarto = C.html,
	r = C.hash,
	racket = C.lisp_l,
	rasi = C.cxx_l,
	readline = C.hash,
	rego = C.hash,
	remind = C.hash,
	rescript = C.cxx_l,
	robot = C.hash,
	ron = C.cxx_l,
	ruby = C.hash,
	rust = C.cxx_l,
	sbt = C.cxx_l,
	scala = C.cxx_l,
	scheme = C.lisp_l,
	sh = C.hash,
	solidity = C.cxx_l,
	supercollider = C.cxx_l,
	sql = C.dash,
	stata = C.cxx_l,
	svelte = C.html,
	swift = C.cxx_l,
	sxhkdrc = C.hash,
	tablegen = C.cxx_l,
	teal = C.dash,
	terraform = C.hash,
	tex = C.latex,
	template = C.dbl_hash,
	tmux = C.hash,
	toml = C.hash,
	twig = C.twig,
	typescript = C.cxx_l,
	typescriptreact = C.cxx_l,
	typst = C.cxx_l,
	v = C.cxx_l,
	verilog = C.cxx_l,
	vhdl = C.dash,
	vim = C.vim,
	vifm = C.vim,
	vue = C.html,
	xdefaults = "!%s",
	xml = C.html,
	xonsh = C.hash,
	yaml = C.hash,
	yuck = C.lisp_l,
	zig = C.cxx_l,
}, {
	-- Support for compound filetype i.e. 'ios.swift', 'ansible.yaml' etc.
	__index = function(this, k)
		local base, fallback = string.match(k, "^(.-)%.(.*)")
		if not (base or fallback) then
			return nil
		end
		return this[base] or this[fallback]
	end,
})

-- ASCII Art mappings for characters
local ascii_art_map = {
	[" "] = { " ", " " },
	a = {
		"▄▀█",
		"█▀█",
	},
	b = {
		"█▄▄",
		"█▄█",
	},
	c = {
		"█▀▀",
		"█▄▄",
	},
	d = {
		"█▀▄",
		"█▄▀",
	},
	e = {
		"█▀▀",
		"██▄",
	},
	f = {
		"█▀▀",
		"█▀░",
	},
	g = {
		"█▀▀",
		"█▄█",
	},
	h = {
		"█░█",
		"█▀█",
	},
	i = {
		"█",
		"█",
	},
	j = {
		"░░█",
		"█▄█",
	},
	k = {
		"█▄▀",
		"█░█",
	},
	l = {
		"█░░",
		"█▄▄",
	},
	m = {
		"█▀▄▀█",
		"█░▀░█",
	},
	n = {
		"█▄░█",
		"█░▀█",
	},
	o = {
		"█▀█",
		"█▄█",
	},
	p = {
		"█▀█",
		"█▀▀",
	},
	q = {
		"█▀█",
		"▀▀█",
	},
	r = {
		"█▀█",
		"█▀▄",
	},
	s = {
		"█▀",
		"▄█",
	},
	t = {
		"▀█▀",
		"░█░",
	},
	u = {
		"█░█",
		"█▄█",
	},
	v = {
		"█░█",
		"▀▄▀",
	},
	w = {
		"█░█░█",
		"▀▄▀▄▀",
	},
	x = {
		"▀▄▀",
		"█░█",
	},
	y = {
		"█▄█",
		"░█░",
	},
	z = {
		"▀█",
		"█▄",
	},
}

-- Function to convert a string to its ASCII Art representation
local function stringToBigComment(input, indentLevel, comment_symbol)
	local trimmed = input:gsub("^%s*(.-)%s*$", "%1")
	local indent = vim.api.nvim_buf_get_option(0, "expandtab") and string.rep(" ", indentLevel)
		or string.rep("\t", indentLevel)

	local lines = { " ", " " }

	for i = 1, #trimmed do
		local char = trimmed:sub(i, i)
		local art = ascii_art_map[string.lower(char)]
		if art then
			for lineIndex, artLine in ipairs(art) do
				lines[lineIndex] = lines[lineIndex] .. artLine .. " "
			end
		else
			print("Character not defined in ASCII art map:", char)
			return
		end
	end

	for index, line in ipairs(lines) do
		lines[index] = string.format(indent .. comment_symbol, line)
	end

	return lines
end

function M.bigcomment()
	local filetype = vim.bo.filetype
	local comment_symbol = L[filetype]

	local line = vim.api.nvim_get_current_line()
	local lineNum, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local indent = vim.fn.indent(lineNum)

	local bigline = stringToBigComment(line, indent, comment_symbol)

	vim.api.nvim_buf_set_lines(0, lineNum - 1, lineNum, false, bigline)
end

return M
