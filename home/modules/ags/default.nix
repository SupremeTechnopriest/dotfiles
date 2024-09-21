
# ▄▀█ █▀▀ █▀ 
# █▀█ █▄█ ▄█ 


inputs : { config, lib, pkgs, ... }:

{
  # Add options for hyprland, a wayland window manager
  options.ags.enable = lib.mkEnableOption "ags";

  # Import home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  # Enable hyprland if desired
  config = lib.mkIf config.ags.enable {

    # Required packages
    home.packages = with pkgs; [
      bun
      dart-sass
      fd
      brightnessctl
      swww
      slurp
      wf-recorder
      wl-clipboard
      wayshot
      swappy
      hyprpicker
      pavucontrol
      networkmanager
      gtk3
    ];

    programs.ags = {
      enable = true;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };

    # Add scripts
    xdg.configFile."ags".source = ./config;
    # xdg.configFile."ags/settings.js".source = ./config/settings.js;
    # xdg.configFile."ags/config.js".source = ./config/main.js;
    # xdg.configFile."ags/style.css".source = ./config/style.css;
    # xdg.configFile."ags/theme.css".source = ./config/theme.css;
    # xdg.configFile."ags/components".source = ./config/components;
    # xdg.configFile."ags/services".source = ./config/services;
    # xdg.configFile."ags/styles".source = ./config/styles;
    # xdg.configFile."ags/utils".source = ./config/utils;
  };
}

