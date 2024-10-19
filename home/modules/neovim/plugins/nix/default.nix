
# █▄░█ █ ▀▄▀ 
# █░▀█ █ █░█ 
# Nix Utilities

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      nix.enable = true;

    };
  };
}
