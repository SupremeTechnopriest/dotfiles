
# ▀█▀ █▀▀ █▀▄▀█ █▀█ █░░ ▄▀█ ▀█▀ █▀▀   █▀ ▀█▀ █▀█ █ █▄░█ █▀▀ 
# ░█░ ██▄ █░▀░█ █▀▀ █▄▄ █▀█ ░█░ ██▄   ▄█ ░█░ █▀▄ █ █░▀█ █▄█ 
# Template String Auto Quoter

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      template-string-nvim
    ]; 

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
