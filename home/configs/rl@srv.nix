
# █▀█ █░░   █▀▄ █▀▀ █▀ █▄▀ 
# █▀▄ █▄▄   █▄▀ ██▄ ▄█ █░█ 

{ self, ... } : { config, lib, pkgs, ... }:

{

  # Custom modules
  fonts.enable = true;
  btop.enable = true;
  neovim.enable = true;
  kitty.enable = true;
  zsh.enable = true;
  starship.enable = true;
  xdg.config.enable = true;

  home = {

    # Home variables
    stateVersion = "23.11";

    # Set environment variables
    sessionVariables = {

      # Programs to use
      EDITOR = "neovide";
      FILE = "ranger";
    };

    # Packages to install
    packages = with pkgs; [
      # Programs
      discordo
      neofetch
      _1password
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
