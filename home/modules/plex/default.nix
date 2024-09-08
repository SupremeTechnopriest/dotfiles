
# █▀█ █░░ █▀▀ ▀▄▀ 
# █▀▀ █▄▄ ██▄ █░█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for plex
  options.plex.enable = lib.mkEnableOption "plex";

  # Install plex if desired
  config = lib.mkIf config.plex.enable {

    # Configure plex prompt for various shells
    services.plex = {

      # Enable plex
      enable = true;
      openFirewall = true;
      user = "media"; 
    };
  };
};
