
# ▀█ █▀ █░█ 
# █▄ ▄█ █▀█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for zsh shell
  options.zsh.enable = lib.mkEnableOption "zsh";

  # Install and configure zsh if desired
  config = lib.mkIf config.zsh.enable {

    programs.zsh = {

      # Enable zsh
      enable = true;

      # Enable zsh features
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "aliases"
          "git"
          "sudo"
          "docker"
          "kubectl"
          "helm"
          "minikube"
          "bun"
          "npm"
          "postgres"
          "rsync"
          "safe-paste"
          "ssh"
          "stripe"
          "kitty"
          "1password"
        ];
        theme = "robbyrussell";
      };

      # Plugins
      plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];

      # Configure shell aliases for zsh
      shellAliases = {
      	# Nixos switch
      	hmswitch = "home-manager switch --option eval-cache false --show-trace --flake $1";
        nixswitch = "sudo nixos-rebuild switch --flake $1";
        # File browsing
        cat = "bat";
        ls = "eza";
        ll = "eza -alh";
        lf = "ranger";
        tree = "eza --tree";
        z = "zoxide";
        zz = "z -";
        # Directory Shortcuts
        cdp = "cd ~/Code/projects";
        emp = "cd ~/Code/projects/edgemesh";
        # SSH
        rdsk = "ssh rl@dsk.local.com";
        rsrv = "ssh rl@srv.local.com";
        # Zellij
        zj = "zellij";
      };

    };
  };
}
