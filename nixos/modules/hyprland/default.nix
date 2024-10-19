
# █░█ █▄█ █▀█ █▀█ █░░ ▄▀█ █▄░█ █▀▄ 
# █▀█ ░█░ █▀▀ █▀▄ █▄▄ █▀█ █░▀█ █▄▀ 

inputs : { config, lib, pkgs, ... }:

{
  # Add options for hyprland
  options.hyprland.enable = lib.mkEnableOption "hyprland";

  # Enable hyprland if desired
  config = lib.mkIf config.hyprland.enable {

    # Enable the hyprland module
    programs.hyprland = {
      enable = true;
      portalPackage = inputs.hyprland-portal.packages."${pkgs.stdenv.hostPlatform.system}".xdg-desktop-portal-hyprland;
    };
  };
}
