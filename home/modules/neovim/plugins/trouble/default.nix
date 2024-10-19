
# ▀█▀ █▀█ █▀█ █░█ █▄▄ █░░ █▀▀ 
# ░█░ █▀▄ █▄█ █▄█ █▄█ █▄▄ ██▄ 
# Diagnostics

{ pkgs, ... }:

{
  programs.nixvim = {

    extraConfigLua = builtins.readFile ./config.lua;

    plugins = {

      trouble = {
        enable = true;
      };

    };
  };
}
