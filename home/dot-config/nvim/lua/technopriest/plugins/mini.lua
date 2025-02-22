-- █▀▄▀█ █ █▄░█ █
-- █░▀░█ █ █░▀█ █
-- Mini Modules

return {
  "echasnovski/mini.nvim",
  priority = 9999,
  lazy = false,
  config = function()
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.bracketed").setup()
    require("mini.cursorword").setup()
    require("mini.comment").setup()
    require("mini.icons").setup()
    require("mini.move").setup()
    require("mini.operators").setup()
    require("mini.pairs").setup()
    require("mini.trailspace").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.sessions").setup()

    local disabled_line_decoration = {
      "snacks_dashboard",
      "oil",
      "notify",
      "snacks_notif",
      "lazy",
      "mason",
      "noice",
    }

    local disabled_animation = {
      "snacks_dashboard",
      "notify",
      "noice",
      "snacks_notif",
      "oil",
    }

    vim.api.nvim_create_autocmd("Filetype", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if not vim.tbl_contains(disabled_line_decoration, ft) then
          vim.b[args.buf].minitrailspace_disable = true
        end
        if vim.tbl_contains(disabled_animation, ft) then
          vim.b[args.buf].minianimate_disable = true
        end
      end
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'SnacksDashboardOpened',
      callback = function(args)
        vim.b[args.buf].minitrailspace_disable = true
      end
    })
  end,
}
