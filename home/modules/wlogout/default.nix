
# █░█░█ █░░ █▀█ █▀▀ █▀█ █░█ ▀█▀ 
# ▀▄▀▄▀ █▄▄ █▄█ █▄█ █▄█ █▄█ ░█░ 


_: { config, lib, pkgs, ... }:

{
  # Add options for wlogout, a terminal prompt
  options.wlogout.enable = lib.mkEnableOption "wlogout";

  # Install wlogout if desired
  config = lib.mkIf config.wlogout.enable {

  };
}
