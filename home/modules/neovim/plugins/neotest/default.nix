
# █▄░█ █▀▀ █▀█ ▀█▀ █▀▀ █▀ ▀█▀ 
# █░▀█ ██▄ █▄█ ░█░ ██▄ ▄█ ░█░ 
# Test Runner

{ pkgs, ... }:

{
  programs.nixvim = {
    extraConfigLua = builtins.readFile ./config.lua;

    plugins = {

      neotest = {
        enable = true;

        adapters = {
          jest.enable = true;
          vitest.enable = true;
          zig.enable = true;
          go.enable = true;
        };
      };

    };
  };
}
