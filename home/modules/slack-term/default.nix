
# █▀ █░░ ▄▀█ █▀▀ █▄▀   ▀█▀ █▀▀ █▀█ █▀▄▀█ 
# ▄█ █▄▄ █▀█ █▄▄ █░█   ░█░ ██▄ █▀▄ █░▀░█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for slack-term
  options.slack-term.enable = lib.mkEnableOption "slack-term";

  # Install slack-term if desired
  config = lib.mkIf config.slack-term.enable {

    xdg.configFile."slack-term/config".source = ./config.json;

    home.packages = with pkgs; [
      slack-term
    ];

  };
}
