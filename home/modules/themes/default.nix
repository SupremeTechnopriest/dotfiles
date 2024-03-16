
# ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀ 
# ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█ 


_: { config, lib, pkgs, ... }:

{
  # Add options for themes, a terminal prompt
  options.themes.enable = lib.mkEnableOption "themes";

  # Install themes if desired
  config = lib.mkIf config.themes.enable {

  };
}
