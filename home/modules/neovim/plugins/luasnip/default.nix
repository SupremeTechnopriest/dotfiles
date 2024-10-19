
# █░░ █░█ ▄▀█ █▀ █▄░█ █ █▀█ 
# █▄▄ █▄█ █▀█ ▄█ █░▀█ █ █▀▀ 
# Snippet Engine

{ pkgs, ... }:

{
  xdg.configFile."nvim/snippets".source = ./snippets;

  programs.nixvim = {
    plugins = {

      luasnip = {
        enable = true;

        filetypeExtend = {
          typescript = [ "javascript" ];
        };

        fromLua = [
          {
            paths = {
              __raw = "vim.fn.stdpath('config') .. '/snippets'";
            };
          }
        ];
      };

    };
  };
}
