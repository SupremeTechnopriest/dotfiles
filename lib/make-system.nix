
# █▀▄▀█ ▄▀█ █▄▀ █▀▀   █▀ █▄█ █▀ ▀█▀ █▀▀ █▀▄▀█ 
# █░▀░█ █▀█ █░█ ██▄   ▄█ ░█░ ▄█ ░█░ ██▄ █░▀░█ 

{ self, ... } @ inputs: { name, system }:

let
  config-folder = "${self}/nixos/configs/${name}";
  config-file = import "${config-folder}/configuration.nix" inputs;
  bootloader = "${config-folder}/bootloader.nix";
  hardware = "${config-folder}/hardware-configuration.nix";
  users = "${config-folder}/users.nix";

in inputs.nixpkgs.lib.nixosSystem {
  system = system;
  modules = builtins.attrValues self.nixosModules ++ [
    config-file
    bootloader
    hardware
    users
    inputs.hyprland.nixosModules.default
    {
      networking.hostName = name;
      system.configurationRevision = self.rev or "dirty";
      documentation.man = {
        enable = inputs.nixpkgs.lib.mkDefault true;
        generateCaches = true;
      };
    }
  ];
}
