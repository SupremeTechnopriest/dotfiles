
# ▀█▀ █▀█ █▀▀ █▀▀ █▀ █ ▀█▀ ▀█▀ █▀▀ █▀█ 
# ░█░ █▀▄ ██▄ ██▄ ▄█ █ ░█░ ░█░ ██▄ █▀▄ 
# Incremental Parsing

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      treesitter = {
        enable = true;

        settings = {
          highlight.enable = true;
        };

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          c
          c_sharp
          cairo
          cmake
          cpp
          css
          csv
          devicetree
          diff
          dockerfile
          editorconfig
          fsharp
          git_config
          git_rebase
          gitattributes
          gitcommit
          gitignore
          go
          graphql
          helm
          html
          http
          hyprlang
          javascript
          jq
          jsdoc
          json
          json5
          lua
          luadoc
          make
          markdown
          markdown_inline
          nginx
          nix
          ocaml
          odin
          proto
          regex
          rasi
          robots
          rust
          sql
          ssh_config
          svelte
          swift
          tmux
          toml
          typescript
          vim
          vimdoc
          xml
          yaml
          zig
        ];
      };

      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      treesitter-textobjects.enable = true;
    };
  };
}
