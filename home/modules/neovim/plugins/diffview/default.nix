
# █▀▄ █ █▀▀ █▀▀ █░█ █ █▀▀ █░█░█ 
# █▄▀ █ █▀░ █▀░ ▀▄▀ █ ██▄ ▀▄▀▄▀ 
# Difference Viewier

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      diffview = {
        enable = true;
      };

    };
  };
}
