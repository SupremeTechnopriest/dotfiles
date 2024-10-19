
# ▀█▀ █▄█ █▀█ █▀▀ █▀ █▀▀ █▀█ █ █▀█ ▀█▀   ▀█▀ █▀█ █▀█ █░░ █▀ 
# ░█░ ░█░ █▀▀ ██▄ ▄█ █▄▄ █▀▄ █ █▀▀ ░█░   ░█░ █▄█ █▄█ █▄▄ ▄█ 
# Typescript Utilities

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      typescript-tools = {
        enable = true;
      };

    };
  };
}
