
# █▄░█ █▀▀ █▀█ █▀▀ █ ▀█▀ 
# █░▀█ ██▄ █▄█ █▄█ █ ░█░ 
# Git manager

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      neogit = {
        enable = true;

        settings = {
          kind = "floating";
          commit_popup = {
            kind = "floating";
          };
          preview_buffer = {
            kind = "floating";
          };
          popup = {
            kind = "floating";
          };
          integrations = {
            diffview = true;
            telescope = true;
          };
        };
      };

    };
  };
}
