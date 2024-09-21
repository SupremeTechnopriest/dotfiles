
# █▀█ █░░   █▀▄▀█ ▄▀█ █▀▀ 
# █▀▄ █▄▄   █░▀░█ █▀█ █▄▄ 

{ self, ... } : { config, lib, pkgs, ... }:

{

  # Custom modules
  fonts.enable = true;
  themes.enable = false;
  zsh.enable = true;
  starship.enable = true;
  kitty.enable = true;
  btop.enable = true;
  neovim.enable = true;
  hyprland.enable = true;
  ags.enable = true;
  rofi.enable = true;
  gtk.config.enable = true;
  qt.config.enable = true;
  xdg.config.enable = true;

  home = {

    # Home variables
    stateVersion = "24.05";

    # Set environment variables
    sessionVariables = {

      # Programs to use
      MENU_CMD = "~/.config/rofi/scripts/launch-rofi.sh";
      THEME_SELECT_CMD = "~/.config/rofi/scripts/themeselect-rofi.sh";
      WALL_SELECT_CMD = "~/.config/rofi/scripts/wallselect-rofi.sh";
      EXIT_CMD = "~/.config/wlogout/scripts/launch-wlogout.sh";
      BROWSER = "google-chrome-stable";
      EDITOR = "neovide";
      FILE = "ranger";
      FILEGUI = "nautilus";

      # Other
      USER_LOGO = "~/.dotfiles/assets/rl.png";

      # Hack for Hyprland 
      MESA_GL_VERSION_OVERRIDE = "4.5";
      MESA_GLSL_VERSION_OVERRIDE = "450";
    };

    # Packages to install
    packages = with pkgs; [
      # Programs
      gthumb
      neofetch
      neovide
      _1password

      # Utilities
      mpc_cli
      playerctl
      slurp
      wl-clipboard
    ];
  };
  
  # Configure nixpkgs
  nixpkgs.config = {

    # Allow proprietary software
    allowUnfreePredicate = _: true;

  };

  # Configure programs
  programs = {

    # Configure git
    git = {
      userName  = "SupremeTechnopriest";
      userEmail = "randylebeau@gmail.com";
      lfs.enable = true;
    };

    # Fuzzy file finding
    fzf.enable = true;

    # Cheat sheets
    navi.enable = true;
  };

} 
