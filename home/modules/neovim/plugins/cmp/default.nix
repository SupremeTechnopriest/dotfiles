
# █▀▀ █▀▄▀█ █▀█ 
# █▄▄ █░▀░█ █▀▀ 

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      
      cmp = {
        enable = true;
      };

      cmp-cmdline.enable = true;
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-path.enable = true;
      cmp-snippy.enable = true;

    };
  };
}
