
# █▀▄▀█ █ █▄░█ █ 
# █░▀░█ █ █░▀█ █ 
# Mini Modules

{ pkgs, ... }:

{
  programs.nixvim = {
    extraConfigLua = builtins.readFile ./config.lua;
    plugins = {

      mini = {
        enable = true;

        modules = {
          ai = {};
          animate = {};
          # base16 = {};
          bracketed = {};
          cursorword = {};
          comment = {};
          icons = {};
          indentscope = {};
          move = {};
          operators = {};
          pairs = {};
          trailspace = {};
          surround = {};
          splitjoin = {};
        };

      };

    };
  };
}
