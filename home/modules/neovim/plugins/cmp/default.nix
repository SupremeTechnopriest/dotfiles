
# █▀▀ █▀▄▀█ █▀█ 
# █▄▄ █░▀░█ █▀▀ 
# Autocomplete

{ pkgs, ... }:

{
  programs.nixvim = {


    plugins = {
      
      cmp = {
        enable = true; 
        autoEnableSources = false;
        settings.sources = [
          { name = "path"; }
          { name = "buffer"; }
          { name = "cmdline"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lua"; }
          { name = "gitmoji"; }
          { name = "emoji"; }
          { name = "dap"; }
          { name = "treesitter"; }
          { name = "luasnip"; }
          { name = "zsh"; }
          { name = "git"; }
        ];

        filetype = {
          NeogitCommitMessage = {
            sources = [
              { name = "git"; }
              { name = "gitmoji"; }
            ];
          };
        };

        cmdline = {
          "/" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "buffer";
              }
            ];
          };
          ":" = {
            mapping = {
              __raw = "cmp.mapping.preset.cmdline()";
            };
            sources = [
              {
                name = "path";
              }
              {
                name = "cmdline";
                option = {
                  ignore_cmds = [
                    "Man"
                    "!"
                  ];
                };
              }
            ];
          };
        };

        settings = {
          snippet.expand = ''
            function(args)
            require('luasnip').lsp_expand(args.body)
            end
          '';

           mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-u>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };

          window = {
            completion.border = "rounded"; 
            documentation.border = "rounded";
          };
        };

      };

      cmp-cmdline.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-path.enable = true;
      cmp-emoji.enable = true;
      cmp-dap.enable = true;
      cmp-treesitter.enable = true;
      cmp-zsh.enable = true;
      cmp_luasnip.enable = true;
      cmp-git = {
        enable = true;
        settings = {
          filetypes = [
            "NeogitCommitMessage"
          ];
          remotes = [
            "upstream"
            "origin"
          ];
        };
      };
     
    };

  };
}
