
# █▀▀ █ ▀█▀ █▀ █ █▀▀ █▄░█ █▀ 
# █▄█ █ ░█░ ▄█ █ █▄█ █░▀█ ▄█ 
# Git Line Decorations

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      gitsigns = {
        enable = true;
      };

    };
  };
}
