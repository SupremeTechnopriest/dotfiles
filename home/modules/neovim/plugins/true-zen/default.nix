
# ▀█▀ █▀█ █░█ █▀▀   ▀█ █▀▀ █▄░█ 
# ░█░ █▀▄ █▄█ ██▄   █▄ ██▄ █░▀█ 
# Zen Mode

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      true-zen-nvim
    ];

    extraConfigLua = builtins.readFile ./config.lua;

  };
}
