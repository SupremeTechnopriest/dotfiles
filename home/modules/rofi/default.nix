
# █▀█ █▀█ █▀▀ █ 
# █▀▄ █▄█ █▀░ █ 


_: { config, lib, pkgs, ... }:

{
  # Add options for rofi, a terminal prompt
  options.rofi.enable = lib.mkEnableOption "rofi";

  # Install rofi if desired
  config = lib.mkIf config.rofi.enable {

  };
}
