
# █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▀█   █▀▄▀█ ▄▀█ █▀█ █▄▀ █▀▄ █▀█ █░█░█ █▄░█ 
# █▀▄ ██▄ █░▀█ █▄▀ ██▄ █▀▄   █░▀░█ █▀█ █▀▄ █░█ █▄▀ █▄█ ▀▄▀▄▀ █░▀█ 
# Markdown Renderer

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      render-markdown-nvim
    ]; 

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
