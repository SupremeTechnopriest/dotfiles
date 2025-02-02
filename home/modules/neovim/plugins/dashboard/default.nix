
# █▀▄ ▄▀█ █▀ █░█ █▄▄ █▀█ ▄▀█ █▀█ █▀▄ 
# █▄▀ █▀█ ▄█ █▀█ █▄█ █▄█ █▀█ █▀▄ █▄▀ 
# Welcome Screen

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      dashboard = {
        enable = true;

        settings = {

          theme = "doom";
          change_to_vcs_root = true;

          config = {
            packages.enable = true;
            hideStatusline = true;
            hideTabline = true;
            week_header.enable = true;

            center = [
              {
                icon = "  ";
                desc = "Find File";
                action = "Telescope find_files find_command=rf;--hidden;--files";
                shortcut = "SPC f f";
              }
              {
                icon = "  ";
                desc = "Recently opened";
                action = "Telescope oldfiles";
                shortcut = "SPC f r";
              }
              {
                icon = "פּ  ";
                desc = "File browser";
                action = "Oil";
                shortcut = "SPC f o";
              }
              {
                icon = "  ";
                desc = "Search for word";
                action = "Telescope live_grep";
                shortcut = "SPC f g";
              }
              {
                icon = "  ";
                desc = "Help";
                action = "Telescope help_tags";
                shortcut = "SPC f h";
              }
              {
                icon = "  ";
                desc = "Commands";
                action = "Telescope commands";
                shortcut = "SPC ?";
              }
            ];
          };
        };

      };
    };
  };
}
