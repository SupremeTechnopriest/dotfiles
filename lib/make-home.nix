
# █▀▄▀█ ▄▀█ █▄▀ █▀▀   █░█ █▀█ █▀▄▀█ █▀▀ 
# █░▀░█ █▀█ █░█ ██▄   █▀█ █▄█ █░▀░█ ██▄ 

{ self, ... } @ inputs: { user, host, system }:

let
  config-file = import "${self}/home/configs/${user}@${host}.nix" inputs;
  home-directory = "/home/${user}";

in inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  modules = builtins.attrValues self.homeModules ++ [
    config-file
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    {
      home = {
        username = user;
        homeDirectory = home-directory;
        packages = [
          inputs.home-manager.packages.${system}.home-manager
        ];
      };
      programs.git.enable = inputs.nixpkgs.lib.mkDefault true;
    }
  ];
}
