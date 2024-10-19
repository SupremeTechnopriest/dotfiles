
# █▀█ █ █░░ 
# █▄█ █ █▄▄ 
# File Browser

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      oil = {
        enable = true;

        settings = {
          columns = [
            "icon"
            "type"
            "size"
            "permissions"
          ];

        };
      };

    };
  };
}
