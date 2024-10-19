
# █░░ █ █▄░█ ▀█▀ 
# █▄▄ █ █░▀█ ░█░ 
# Linter

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      lint = {
        enable = true;

        lintersByFt = {
    			javascript = [
            "quick-lint-js"
          ];
          typescript = [
            "quick-lint-js"
          ];
          javascriptreact = [
            "quick-lint-js"
          ];
          typescriptreact = [
            "quick-lint-js"
          ];
          markdown = [
            "markdownlint"
            "cspell"
          ];
        };
      };

    };
  };
}
