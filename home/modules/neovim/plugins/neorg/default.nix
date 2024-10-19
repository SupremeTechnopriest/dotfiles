
# █▄░█ █▀▀ █▀█ █▀█ █▀▀ 
# █░▀█ ██▄ █▄█ █▀▄ █▄█ 
# Note Taking

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      neorg = {
        enable = true;
        modules = {
          "core.defaults" = {};
          "core.dirman" = {
            config = {
              workspaces = {
                personal = "~/Notes/personal";
                work = "~/Notes/work";
              };
            };
          };
        };
      };

    };
  };
}
