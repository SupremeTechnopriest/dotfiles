
# █░█ █▄░█ █▀▄ █▀█ ▀█▀ █▀█ █▀▀ █▀▀ 
# █▄█ █░▀█ █▄▀ █▄█ ░█░ █▀▄ ██▄ ██▄ 
# Undo History

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      undotree = {
        enable = true;
      };

    };
  };
}
