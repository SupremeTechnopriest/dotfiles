
# █▄▄ █░█ █▀▀ █▀▀ █▀▀ █▀█ █░░ █ █▄░█ █▀▀ 
# █▄█ █▄█ █▀░ █▀░ ██▄ █▀▄ █▄▄ █ █░▀█ ██▄ 

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      barbar = {
        enable = true;
      };

    };
  };
}
