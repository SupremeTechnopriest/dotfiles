
# █▀▀ █▀█ █▀▄▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀ 
# █▄▄ █▄█ █░▀░█ █░▀░█ ██▄ █░▀█ ░█░ 

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      comment-nvim = {
        enable = true;
        padding = true;
        sticky = true;
      };
  
    };
  };
}
