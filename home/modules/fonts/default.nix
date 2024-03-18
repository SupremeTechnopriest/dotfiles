
# █▀▀ █▀█ █▄░█ ▀█▀ █▀ 
# █▀░ █▄█ █░▀█ ░█░ ▄█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for fonts application switcher
  options.fonts.enable = lib.mkEnableOption "fonts";

  # Install and configure fonts if desired
  config = lib.mkIf config.fonts.enable {

    # Copy fonts 
    xdg.dataFile."fonts".source = ./fonts;
  };
}
