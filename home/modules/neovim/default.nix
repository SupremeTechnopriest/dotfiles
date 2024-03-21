
# █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█ 
# █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█ 


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

      };

      colorschemes.catppuccin.enable = true;
      colorschemes.catppuccin.flavour = "latte";
      colorschemes.catppuccin.flavour = "mocha";

      colorschemes.rose-pine.enable = true;
      colorschemes.tokyonight.enable = true;
      colorschemes.gruvbox.enable = true;

    };
     
    imports = [

      # Dashboard splash screen
      ./plugins/dashboard

      # File browsing
      ./plugins/neo-tree

    ];

  };
}
