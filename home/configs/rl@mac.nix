
# █▀█ █░░   █▀▄▀█ ▄▀█ █▀▀ 
# █▀▄ █▄▄   █░▀░█ █▀█ █▄▄ 

{ self, ... } : { config, lib, pkgs, ... }:

{

  # Custom modules
  zsh.enable = true;
  starship.enable = true;
  kitty.enable = true;
  btop.enable = true;
  zellij.enable = true;
  neovim.enable = true;
  neofetch.enable = true;
  calcure.enable = true;
  slack-term.enable = true;
  xdg.config.enable = true;

  home = {

    # Home variables
    stateVersion = "24.05";

    # Set environment variables
    sessionVariables = {

      # Programs to use
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
      neofetch
      neovide
      _1password

      # Languages  
      bun
      python3
      go
      zig

      # Utilities
      fx
      glow
      vhs
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
