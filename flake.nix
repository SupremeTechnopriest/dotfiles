
# █▀▀ █░░ ▄▀█ █▄▀ █▀▀ 
# █▀░ █▄▄ █▀█ █░█ ██▄ 

{
  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-portal.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    # Ags
    ags.url = "github:Aylur/ags";
    astal.url = "github:Aylur/astal";

    # Zellij
    zjstatus.url = "github:dj95/zjstatus";

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = inputs: {

    # System configurations and modules
    nixosConfigurations = import ./nixos/configs inputs;
    nixosModules = import ./nixos/modules inputs;

    # Home-manager configurations and modules
    homeConfigurations = import ./home/configs inputs;
    homeModules = import ./home/modules inputs;

    # Custom library functions
    lib = import ./lib inputs;

  };
 }
