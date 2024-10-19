
# █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█ 
# █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█ 
# Text Editor

_: { config, lib, pkgs, ... }:

{
  # Add options for neovim, a terminal prompt
  options.neovim.enable = lib.mkEnableOption "neovim";

  # Install neovim if desired
  config = lib.mkIf config.neovim.enable {
    
    # Configure neovim
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      globals = {
        # Leader
        mapleader = " ";
        localleader = ",";
      };

      opts = {
        # Cursor
        cursorline = true;
        number = true;
        termguicolors = true;

        # Numbers
        nu = true;
        relativenumber = true;

        # Tabs
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = true;

        # Indent
        smartindent = true;

        # Search
        hlsearch = true;
        incsearch = true;

        # Fold
        foldenable = true;
        foldcolumn = "1";
        foldlevel = 99;
        foldlevelstart = 99;
        fillchars = {
          eob = " ";
          fold = " ";
          foldopen = "";
          foldsep = " ";
          foldclose = "";
        };
      };

      performance = {
        byteCompileLua = {
          enable = true;
          nvimRuntime = true;
          plugins = true;
        };

        combinePlugins = {
          enable = false;
        };
      };

      colorschemes.catppuccin.enable = true;
      # colorschemes.catppuccin.flavour = "latte";
      colorschemes.catppuccin.settings.flavour = "mocha";

      # colorschemes.rose-pine.enable = true;
      # colorschemes.tokyonight.enable = true;
      # colorschemes.gruvbox.enable = true;

    };
     
  };

  imports = [
    # Mini Modules
    ./plugins/mini

    # Bars 
    ./plugins/barbar
    ./plugins/lualine
    ./plugins/modicator
    ./plugins/statuscol

    # File browsing
    # ./plugins/neo-tree
    ./plugins/oil
    # ./plugins/projectionist

    # Navigation
    ./plugins/flash
    ./plugins/harpoon

    # Dashboard splash screen
    ./plugins/dashboard

    # LSP
    ./plugins/lsp
    ./plugins/mason
    ./plugins/typescript-tools
    ./plugins/conform-nvim
    ./plugins/lint
    ./plugins/dap
    ./plugins/nix
    ./plugins/helm

    # Git
    ./plugins/gitmoji
    ./plugins/gitsigns
    ./plugins/diffview
    ./plugins/neogit

    # Auto completions
    ./plugins/cmp

    # Treesitter
    ./plugins/treesitter

    # Telescope
    ./plugins/telescope

    # User Interface 
    ./plugins/notify
    ./plugins/noice

    # Diagnostics
    ./plugins/trouble

    # Annotations
    ./plugins/neogen

    # Zen
    ./plugins/true-zen
    ./plugins/twilight

    # History
    ./plugins/undotree


    # Comments
    ./plugins/todo-comments
    # ./plugins/bigcomment

    # Utilities
    ./plugins/template-string

    # Style
    ./plugins/rainbow-delimiters

    # Rich Presence
    ./plugins/neocord

    # Notes
    ./plugins/neorg

    # Projects
    ./plugins/project-nvim

    # Testing
    ./plugins/neotest

    # Folding
    ./plugins/nvim-ufo

    # Marks
    ./plugins/marks

    # Snippets
    ./plugins/luasnip

    # Split manager
    ./plugins/smart-splits

    # Key hints
    ./plugins/which-key

    # Markdown Tools
    ./plugins/render-markdown

  ];

}
