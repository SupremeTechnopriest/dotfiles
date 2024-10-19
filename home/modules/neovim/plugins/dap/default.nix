
# █▀▄ ▄▀█ █▀█ 
# █▄▀ █▀█ █▀▀ 
# Debug Adapter Protocol

{ pkgs, ... }:

{
  programs.nixvim = {
    extraConfigLua = builtins.readFile ./config.lua;

    plugins = {

      dap = {
        enable = true;

        extensions = {
          dap-ui = {
            enable = true;
          };
        };
      };

    };
  };
}
