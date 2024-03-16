
# █▀█ █░░   █▀▄ █▀▀ █▀ █▄▀ 
# █▀▄ █▄▄   █▄▀ ██▄ ▄█ █░█ 

{ self, ... } : { config, lib, pkgs, ... }:

{
  home = {

    # Custom modules
    themes.enable = true;
    btop.enable = true;
    dunst.enable = true;
    chrome.enable = true;
    neovim.enable = true;
    hyprland.enable = true;
    fcitx.enable = true;
    mangohud.enable = true;
    mpv.enable = true;
    kitty.enable = true;
    zsh.enable = true;
    starship.enable = true;
    rofi.enable = true;
    waybar.enable = true;
    wlogout.enable = true;
    xdg.config.enable = true;
    gtk.config.enable = true;
    qt.config.enable = true;

    # Home variables
    stateVersion = "22.11";

    # Set environment variables
    sessionVariables = {

      # Programs to use
      MENU_CMD = "~/.config/rofi/scripts/launch-rofi.sh";
      EXIT_CMD = "~/.config/wlogout/scripts/launch-wlogout.sh";
      BROWSER = "chrome";
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
      discord
      gthumb
      neofetch
      neovide
      libresprite
      obsidian
      slack
      vesktop

      # Utilities
      mpc_cli
      playerctl
      rnix-lsp
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
