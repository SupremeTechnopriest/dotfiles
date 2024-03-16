
# ▀█ █▀ █░█ 
# █▄ ▄█ █▀█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for zsh shell
  options.zsh.enable = lib.mkEnableOption "zsh";

  # Install and configure zsh if desired
  config = lib.mkIf config.zsh.enable {

    # Configure zsh shell
    programs.zsh = {

      # Enable zsh
      enable = true;

      # Enable zsh features
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git"
          "zsh-vi-mode"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "1password"
        ];
        theme = "robbyrussell";
      };

      # Configure shell aliases for zsh
      shellAliases = {

      };

    };
  };
}
