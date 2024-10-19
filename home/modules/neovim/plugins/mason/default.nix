
# █▀▄▀█ ▄▀█ █▀ █▀█ █▄░█ 
# █░▀░█ █▀█ ▄█ █▄█ █░▀█ 
# Tool Installer

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      mason-nvim
      mason-tool-installer-nvim
    ]; 

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
