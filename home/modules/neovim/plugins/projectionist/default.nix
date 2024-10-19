
# █▀█ █▀█ █▀█ ░░█ █▀▀ █▀▀ ▀█▀ █ █▀█ █▄░█ █ █▀ ▀█▀ 
# █▀▀ █▀▄ █▄█ █▄█ ██▄ █▄▄ ░█░ █ █▄█ █░▀█ █ ▄█ ░█░ 
# Project File Alternates


{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      vim-projectionist 
    ]; 

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
