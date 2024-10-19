
# █▀█ ▄▀█ █ █▄░█ █▄▄ █▀█ █░█░█   █▀▄ █▀▀ █░░ █ █▀▄▀█ █ ▀█▀ █▀▀ █▀█ █▀ 
# █▀▄ █▀█ █ █░▀█ █▄█ █▄█ ▀▄▀▄▀   █▄▀ ██▄ █▄▄ █ █░▀░█ █ ░█░ ██▄ █▀▄ ▄█ 
# Colored Delimiter Nesting

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      rainbow-delimiters = {
        enable = true;
        strategy = {
          default = "global";
          html = "local";
        };
      };

    };
  };
}
