local M = {}

M.base_30 = {
	white = "#c0caf5",
	darker_black = "#16161e",
	black = "#1a1b26", --  nvim bg
	black2 = "#1f2336",
	one_bg = "#24283b",
	one_bg2 = "#414868",
	one_bg3 = "#353b45",
	grey = "#40486a",
	grey_fg = "#565f89",
	grey_fg2 = "#4f5779",
	light_grey = "#545c7e",
	red = "#f7768e",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#32333e", -- for lines like vertsplit
	green = "#9ece6a",
	vibrant_green = "#73daca",
	nord_blue = "#80a8fd",
	blue = "#7aa2f7",
	yellow = "#e0af68",
	sun = "#EBCB8B",
	purple = "#bb9af7",
	dark_purple = "#9d7cd8",
	teal = "#1abc9c",
	orange = "#ff9e64",
	cyan = "#7dcfff",
	statusline_bg = "#1d1e29",
	lightbg = "#32333e",
	pmenu_bg = "#7aa2f7",
	folder_bg = "#7aa2f7",
}

M.base_16 = {
	base00 = "#1a1b26",
	base01 = "#16161e",
	base02 = "#2f3549",
	base03 = "#444b6a",
	base04 = "#787c99",
	base05 = "#a9b1d6",
	base06 = "#cbccd1",
	base07 = "#d5d6db",
	base08 = "#73daca",
	base09 = "#ff9e64",
	base0A = "#0db9d7",
	base0B = "#9ece6a",
	base0C = "#b4f9f8",
	base0D = "#2ac3de",
	base0E = "#bb9af7",
	base0F = "#f7768e",
}

M.polish_hl = {
	treesitter = {
		["@variable"] = { fg = M.base_16.base05 },
		["@punctuation.bracket"] = { fg = M.base_30.purple },
		["@function.method.call"] = { fg = M.base_30.red },
		["@function.call"] = { fg = M.base_30.blue },
		["@constant"] = { fg = M.base_30.orange },
		["@variable.parameter"] = { fg = M.base_30.orange },
	},
}

M.type = "dark"

return M

-- local M = {}
--
-- M.base_30 = {
-- 	white = "#D3C6AA",
-- 	darker_black = "#272f35",
-- 	black = "#2b3339", --  nvim bg
-- 	black2 = "#323a40",
-- 	one_bg = "#363e44",
-- 	one_bg2 = "#363e44",
-- 	one_bg3 = "#3a4248",
-- 	grey = "#4e565c",
-- 	grey_fg = "#545c62",
-- 	grey_fg2 = "#626a70",
-- 	light_grey = "#656d73",
-- 	red = "#e67e80",
-- 	baby_pink = "#ce8196",
-- 	pink = "#ff75a0",
-- 	line = "#3a4248", -- for lines like vertsplit
-- 	green = "#83c092",
-- 	vibrant_green = "#a7c080",
-- 	nord_blue = "#78b4ac",
-- 	blue = "#7393b3",
-- 	yellow = "#dbbc7f",
-- 	sun = "#d1b171",
-- 	purple = "#ecafcc",
-- 	dark_purple = "#d699b6",
-- 	teal = "#69a59d",
-- 	orange = "#e69875",
-- 	cyan = "#95d1c9",
-- 	statusline_bg = "#2e363c",
-- 	lightbg = "#3d454b",
-- 	pmenu_bg = "#83c092",
-- 	folder_bg = "#7393b3",
-- }
--
-- M.base_16 = {
-- 	base00 = "#2b3339",
-- 	base01 = "#323c41",
-- 	base02 = "#3a4248",
-- 	base03 = "#424a50",
-- 	base04 = "#4a5258",
-- 	base05 = "#d3c6aa",
-- 	base06 = "#ddd0b4",
-- 	base07 = "#e7dabe",
-- 	base08 = "#7fbbb3",
-- 	base09 = "#d699b6",
-- 	base0A = "#83c092",
-- 	base0B = "#dbbc7f",
-- 	base0C = "#e69875",
-- 	base0D = "#a7c080",
-- 	base0E = "#e67e80",
-- 	base0F = "#d699b6",
-- }
--
-- M.type = "dark"
--
-- M.polish_hl = {
-- 	treesitter = {
-- 		["@tag"] = { fg = M.base_30.orange },
-- 		["@tag.delimiter"] = { fg = M.base_30.green },
-- 	},
-- }
--
-- return M
