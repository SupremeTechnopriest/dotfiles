
# █▀▀ █░░ ▄▀█ █▄▀ █▀▀ 
# █▀░ █▄▄ █▀█ █░█ ██▄ 

{
  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-portal.url = "github:hyprwm/xdg-desktop-portal-hyprland";
  };
  outputs = inputs: {
    # System configurations and modules
    nixosConfigurations = import ./nixos/configs inputs;
    nixosModules = import ./nixos/modules inputs;

    # Home-manager configurations and modules
    homeConfigurations = import ./home/configs inputs;
    homeModules = import ./home/modules inputs;
  };
}
