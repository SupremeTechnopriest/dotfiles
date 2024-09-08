
# █▄░█ ▀█ █▄▄ █▀▀ █▀▀ ▀█▀ 
# █░▀█ █▄ █▄█ █▄█ ██▄ ░█░ 

_: { config, lib, pkgs, ... }:

{
  # Add options for nzbget
  options.nzbget.enable = lib.mkEnableOption "nzbget";

  # Install nzbget if desired
  config = lib.mkIf config.nzbget.enable {

    # Configure nzbget prompt for various shells
    services.nzbget = {

      # Enable plex
      enable = true;
      user = "media"; 
    };
  };
};
