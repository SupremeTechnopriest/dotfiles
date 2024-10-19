
# █░█ █▀▀ █▀█ 
# █▄█ █▀░ █▄█ 
# Modern Folding

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      nvim-ufo = {
        enable = true;
        settings = {
          provider_selector = ''
            function()
              return { "treesitter", "indent" }
            end
          '';
        };
      };

    };
  };
}
