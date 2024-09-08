
# █▀█ ▄▀█ █▀▄ ▄▀█ █▀█ █▀█ 
# █▀▄ █▀█ █▄▀ █▀█ █▀▄ █▀▄ 

_: { config, lib, pkgs, ... }:

{
  # Add options for sonarr
  options.radarr.enable = lib.mkEnableOption "radarr";

  # Install radarr if desired
  config = lib.mkIf config.radarr.enable {

    # Configure radarr prompt for various shells
    services.radarr = {

      # Enable radarr
      enable = true;
      openFirewall = true;
    };
  };
};
