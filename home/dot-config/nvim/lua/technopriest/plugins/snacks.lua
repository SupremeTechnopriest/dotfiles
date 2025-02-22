-- █▀ █▄░█ ▄▀█ █▀▀ █▄▀ █▀
-- ▄█ █░▀█ █▀█ █▄▄ █░█ ▄█
-- QOL Plugins

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {},
    dashboard = {
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = vim.fn.isdirectory(".git") == 1,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    toggle = {
      map = vim.keymap.set,
      which_key = true,
      notify = true,
      icon = {
        enabled = " ",
        disabled = " ",
      },
      color = {
        enabled = "green",
        disabled = "yellow",
      },
    },
    indent = {},
    quickfile = {},
    terminal = {},
    notifier = {},
    zen = {},
    dim = {},
  },
}
