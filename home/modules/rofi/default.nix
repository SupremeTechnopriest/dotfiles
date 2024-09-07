_: { config, lib, pkgs, ... }:

{
  # Add options for rofi application switcher
  options.rofi.enable = lib.mkEnableOption "rofi";

  # Install and configure rofi if desired
  config = lib.mkIf config.rofi.enable {

    # Enable rofi
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland-unwrapped;
    };

    # Configure rofi
    xdg.configFile."rofi/launcher.rasi".text = builtins.readFile ./launcher.rasi;
    xdg.configFile."rofi/quickapps.rasi".text = builtins.readFile ./quickapps.rasi;
    xdg.configFile."rofi/themeselect.rasi".text = builtins.readFile ./themeselect.rasi;
    xdg.configFile."rofi/screenshot.rasi".text = builtins.readFile ./screenshot.rasi;
    xdg.configFile."rofi/extra-config.rasi".text = '''';

    # Copy scripts folder
    xdg.configFile."rofi/scripts".source = ./scripts;
  };
}
