
# █▀▀ █ ▀█▀ █▀▄▀█ █▀█ ░░█ █ 
# █▄█ █ ░█░ █░▀░█ █▄█ █▄█ █ 
# Git Commit Message Emojis

{ pkgs, ... }:

{
  programs.nixvim = {

    extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "gitmoji.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "Dynge";
        repo = "gitmoji.nvim";
        rev = "326ddf01cbf3425566a089126ece7e8bd2560601";
        hash = "sha256-EZHclDtuyZWXTBOVU4C+Km/YNM1oAIazQT4wBI5K7vo=";
      };
    })];

    extraConfigLua = builtins.readFile ./config.lua;
  };
}
