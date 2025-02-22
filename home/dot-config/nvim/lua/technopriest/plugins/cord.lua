-- █▀▀ █▀█ █▀█ █▀▄
-- █▄▄ █▄█ █▀▄ █▄▀
-- Rich Presence Discord Integration

return {
	"vyfor/cord.nvim",
	build = "./build || .\\build",
	event = "VeryLazy",
	opts = {
		usercmds = true, -- Enable user commands
		log_level = "error", -- One of 'trace', 'debug', 'info', 'warn', 'error', 'off'
		timer = {
			interval = 1500, -- Interval between presence updates in milliseconds (min 500)
			reset_on_idle = false, -- Reset start timestamp on idle
			reset_on_change = false, -- Reset start timestamp on presence change
		},
		editor = {
			image = "https://raw.githubusercontent.com/IogaMaster/neocord/main/assets/logos/Neovim.png", -- Image ID or URL in case a custom client id is provided
			client = "neovim", -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
			tooltip = "The Superior Text Editor", -- Text to display when hovering over the editor's image
		},
		display = {
			show_time = true, -- Display start timestamp
			show_repository = false, -- Display 'View repository' button linked to repository url, if any
			show_cursor_position = true, -- Display line and column number of cursor's position
			swap_fields = false, -- If enabled, workspace is displayed first
			swap_icons = true, -- If enabled, editor is displayed on the main image
			workspace_blacklist = {}, -- List of workspace names that will hide rich presence
		},
		lsp = {
			show_problem_count = false, -- Display number of diagnostics problems
			severity = 1, -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
			scope = "workspace", -- buffer or workspace
		},
		idle = {
			enable = true, -- Enable idle status
			show_status = true, -- Display idle status, disable to hide the rich presence on idle
			timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
			disable_on_focus = true, -- Do not display idle status when neovim is focused
			text = "Idle", -- Text to display when idle
			tooltip = "💤", -- Text to display when hovering over the idle image
			details = function(opts)
				return "Taking a break from " .. opts.workspace
			end,
		},
		text = {
			workspace = function(opts)
				local hour = tonumber(os.date("%H"))
				local status = hour >= 22 and "🌙 Late night coding"
					or hour >= 18 and "🌆 Evening session"
					or hour >= 12 and "☀️ Afternoon coding"
					or hour >= 5 and "🌅 Morning productivity"
					or "🌙 Midnight hacking"

				return status .. ": " .. opts.workspace
			end,
		},
		-- buttons = {
		-- 	{
		-- 		label = "Github",
		-- 		url = "https://github.com/supremetechnopriest",
		-- 	},
		-- 	{
		-- 		label = "Edgemesh",
		-- 		url = "https://edgemesh.com",
		-- 	},
		-- },
		assets = nil,
		variables = true,
	},
}
