
# █▀▀ ▄▀█ █░░ █▀▀ █░█ █▀█ █▀▀ 
# █▄▄ █▀█ █▄▄ █▄▄ █▄█ █▀▄ ██▄ 

_: { config, lib, pkgs, ... }:

{
  # Add options for calcure
  options.calcure.enable = lib.mkEnableOption "calcure";

  # Install calcure if desired
  config = lib.mkIf config.calcure.enable {

    home.packages = with pkgs; [
      calcure
    ];

  };
}
