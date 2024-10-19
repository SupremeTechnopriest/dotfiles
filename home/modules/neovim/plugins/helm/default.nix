
# █░█ █▀▀ █░░ █▀▄▀█ 
# █▀█ ██▄ █▄▄ █░▀░█ 
# Helm Utilites

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      helm.enable = true;

    };
  };
}
