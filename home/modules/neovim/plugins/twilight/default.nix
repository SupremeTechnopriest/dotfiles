
# ▀█▀ █░█░█ █ █░░ █ █▀▀ █░█ ▀█▀ 
# ░█░ ▀▄▀▄▀ █ █▄▄ █ █▄█ █▀█ ░█░ 
# Zen Dimming

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      twilight = {
        enable = true;

        settings = {
          context = 20;
          dimming = {
            alpha = 0.4;
          };
          expand = [
            "function"
            "method"
            "table"
            "if_statement"
          ];
          treesitter = true;
        };
      };

    };

    extraConfigLua = builtins.readFile ./config.lua;
  };
}
