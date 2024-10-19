
# █▀█ █░░   █▀▄ █▀▀ █▀ █▄▀ 
# █▀▄ █▄▄   █▄▀ ██▄ ▄█ █░█ 

{ self, ... } : { config, lib, pkgs, ... }:

{

  # Custom modules
  fonts.enable = true;
  themes.enable = true;
  btop.enable = true;
  dunst.enable = false;
  neovim.enable = true;
  hyprland = {
    enable = true;
    nvidia.enable = true;
    monitors.enable = true;
  };

  ags.enable = true;
  # mangohud.enable = true;
  # mpv.enable = true;
  kitty.enable = true;
  zsh.enable = true;
  starship.enable = true;
  swaylock.enable = false;
  rofi.enable = true;
  waybar.enable = false;
  wlogout.enable = false;
  xdg.config.enable = true;
  gtk.config.enable = true;
  qt.config.enable = true;

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
    };

    # Packages to install
    packages = with pkgs; [
      # Programs
      audacity
      gthumb
      neofetch
      neovide
      libresprite
      obsidian
      slack
      webcord
      postman
      google-chrome
      _1password
      _1password-gui

      # Utilities
      mpc_cli
      playerctl
      slurp
      wdisplays
      wl-clipboard
    ];
  };
  
  # Configure nixpkgs
  nixpkgs.config = {

    # Allow proprietary software
    allowUnfreePredicate = _: true;

    # Permit specific insecure packages
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
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
