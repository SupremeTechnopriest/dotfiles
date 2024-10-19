
# █▀▀ █░░ ▄▀█ █▀ █░█ 
# █▀░ █▄▄ █▀█ ▄█ █▀█ 
# Code Navigation

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      flash = {
        enable = true;
      };

    };
  };
}
