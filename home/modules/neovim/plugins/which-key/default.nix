
# █░█░█ █░█ █ █▀▀ █░█   █▄▀ █▀▀ █▄█ 
# ▀▄▀▄▀ █▀█ █ █▄▄ █▀█   █░█ ██▄ ░█░ 
# Key Binding Hints

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      which-key = {
      	enable = true;

        settings = {
          plugins = {
            presets = {
              g = true;
              z = true;
              operators = true;
              text_objects = true;
              nav = true;
              motions = true;
            };
          };
        };
      };

    };
  };
}
