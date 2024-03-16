
# █░█░█ ▄▀█ █▄█ █▄▄ ▄▀█ █▀█ 
# ▀▄▀▄▀ █▀█ ░█░ █▄█ █▀█ █▀▄ 


_: { config, lib, pkgs, ... }:

{
  # Add options for waybar, a terminal prompt
  options.waybar.enable = lib.mkEnableOption "waybar";

  # Install waybar if desired
  config = lib.mkIf config.waybar.enable {

  };
}
