
# ▀█▀ █▀▀ █░░ █▀▀ █▀ █▀▀ █▀█ █▀█ █▀▀ 
# ░█░ ██▄ █▄▄ ██▄ ▄█ █▄▄ █▄█ █▀▀ ██▄ 
# Picker

{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {

      telescope = {
        enable = true;

        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
          media-files.enable = true;
        };

        enabledExtensions = [
          # "telescope-emoji"
          # "telescope-gitmoji"
          # "telescope-project.nvim"
        ];
      };

    };

    # extraPlugins = with pkgs.vimPlugins; [
    #   telescope-project-nvim
    # ]; 

    # Add your extra plugins here
    # extraPlugins = [
    #   {
    #     pname = "telescope-gitmoji.nvim";
    #     version = "latest";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "olacin";
    #       repo = "telescope-gitmoji.nvim";
    #       rev = "main";
    #     };
    #   }
    # ];
  };

 }
