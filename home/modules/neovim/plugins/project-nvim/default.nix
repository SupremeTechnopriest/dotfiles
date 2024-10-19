
# █▀█ █▀█ █▀█ ░░█ █▀▀ █▀▀ ▀█▀ 
# █▀▀ █▀▄ █▄█ █▄█ ██▄ █▄▄ ░█░ 
# Project Manager

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      project-nvim = {
        enable = true;
        enableTelescope = true;
      };

    };
  };
}
