
# █▀▄▀█ █▀█ █▀▄ █ █▀▀ ▄▀█ ▀█▀ █▀█ █▀█ 
# █░▀░█ █▄█ █▄▀ █ █▄▄ █▀█ ░█░ █▄█ █▀▄ 
# Cursor Line Mode Highlight

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      modicator-nvim
    ]; 

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
