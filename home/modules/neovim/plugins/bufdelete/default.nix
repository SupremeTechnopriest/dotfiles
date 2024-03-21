
# █▄▄ █░█ █▀▀ █▀▄ █▀▀ █░░ █▀▀ ▀█▀ █▀▀ 
# █▄█ █▄█ █▀░ █▄▀ ██▄ █▄▄ ██▄ ░█░ ██▄ 

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "bufdelete.nvim";
      src = pkgs.fetchFromGitHub {
          owner = "famiu";
          repo = "bufdelete.nvim";
          rev = "f6bcea78afb3060b198125256f897040538bcb81";
      };
    })];

  };
}
