
# █▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█ 
# █░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█ 


_: { config, lib, pkgs, ... }:

{
  # Add options for neovim, a terminal prompt
  options.neovim.enable = lib.mkEnableOption "neovim";

  # Install neovim if desired
  config = lib.mkIf config.neovim.enable {

  };
}
