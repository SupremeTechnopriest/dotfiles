-- █░░ █░█ ▄▀█ █░░ █ █▄░█ █▀▀
-- █▄▄ █▄█ █▀█ █▄▄ █ █░▀█ ██▄
-- Bottom Bar

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    options = {
      theme = "tokyonight",
      disabled_filetypes = {
        statusline = {
          "neo-tree",
          "snacks_dashboard",
          "Avante",
          "AvanteSelectedFiles",
          "AvanteInput",
        },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = {
      "oil",
      "trouble",
    },
  },
}
