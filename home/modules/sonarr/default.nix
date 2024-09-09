
# █▀ █▀█ █▄░█ ▄▀█ █▀█ █▀█ 
# ▄█ █▄█ █░▀█ █▀█ █▀▄ █▀▄ 


_: { config, lib, pkgs, ... }:

{
  # Add options for sonarr
  options.sonarr.enable = lib.mkEnableOption "sonarr";

  # Install sonarr if desired
  config = lib.mkIf config.sonarr.enable {

    # Configure sonarr prompt for various shells
    services.sonarr = {

      # Enable sonarr
      enable = true;
      openFirewall = true;
    };
  };
}
