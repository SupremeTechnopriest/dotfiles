
# █▀ █▀▄▀█ ▄▀█ █▀█ ▀█▀   █▀ █▀█ █░░ █ ▀█▀ █▀ 
# ▄█ █░▀░█ █▀█ █▀▄ ░█░   ▄█ █▀▀ █▄▄ █ ░█░ ▄█ 
# Split Pane Management

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      smart-splits = {
        enable = true;

        settings = {
          ignored_filetypes = [
            "neotree"
            "dashboard"
          ];
          ignored_events = [
            "BufEnter"
            "WinEnter"
          ];
          resize_mode = {
            quit_key = "<ESC>";
            resize_keys = [
              "h"
              "j"
              "k"
              "l"
            ];
            silent = true;
          };
        };
      };

    };
  };
}
