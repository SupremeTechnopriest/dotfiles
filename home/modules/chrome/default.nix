
_: { config, lib, pkgs, ... }:

{
  # Add options for chrome
  options.chrome.enable = lib.mkEnableOption "rofi";

  # Install chrome if desired
  config = lib.mkIf config.chrome.enable {

  };
}
