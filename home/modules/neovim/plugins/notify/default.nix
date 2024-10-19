
# █▄░█ █▀█ ▀█▀ █ █▀▀ █▄█ 
# █░▀█ █▄█ ░█░ █ █▀░ ░█░ 
# Notifications

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      notify = {
        enable = true;
        fps = 60;
        maxWidth = 50;
        timeout = 2000;
        extraOptions = {
          render = "wrapped-default";
        };
      };

    };
  };
}
