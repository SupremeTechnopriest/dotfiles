
# ▀█ █▀▀ █░░ █░░ █ ░░█ 
# █▄ ██▄ █▄▄ █▄▄ █ █▄█ 

inputs: { config, lib, pkgs, ... }:

{
  # Add options for sonarr
  options.zellij.enable = lib.mkEnableOption "zellij";

  # Install sonarr if desired
  config = lib.mkIf config.zellij.enable {

    # ZJ status overlay
    nixpkgs.overlays = [
      (final: prev: {
        zjstatus = inputs.zjstatus.packages.${prev.system}.default;
      })
    ];

    # Copy configs
    xdg.configFile."zellij/config.kdl".source = ./config.kdl;
    xdg.configFile."zellij/layouts/default.kdl".source = ./layouts/default.kdl;

    # Configure zellij 
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
