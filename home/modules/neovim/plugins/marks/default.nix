
# █▀▄▀█ ▄▀█ █▀█ █▄▀ █▀ 
# █░▀░█ █▀█ █▀▄ █░█ ▄█ 
# Better Marks

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      marks = {
        enable = true;
        defaultMappings = true;
        cyclic = true;
      };

    };
  };
}
