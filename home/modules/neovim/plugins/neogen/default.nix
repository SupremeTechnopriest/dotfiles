
# █▄░█ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ 
# █░▀█ ██▄ █▄█ █▄█ ██▄ █░▀█ 
# Annotations

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      neogen = {
        enable = true;
        snippetEngine = "luasnip";
      };

    };
  };
}
