
# █░█ █▄█ █▀█ █▀█ █░░ ▄▀█ █▄░█ █▀▄ 
# █▀█ ░█░ █▀▀ █▀▄ █▄▄ █▀█ █░▀█ █▄▀ 

inputs : { config, lib, pkgs, ... }:

{
  # Add options for hyprland, a Wayland window manager
  options.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland, a Wayland window manager.";
    monitors.enable = lib.mkEnableOption "Enable monitor configuration for Hyprland.";
    nvidia.enable = lib.mkEnableOption "Enable Nvidia configuration for Hyprland.";
  };

  # Enable hyprland if desired
  config = lib.mkIf config.hyprland.enable {

    # Add scripts and configuration files
    xdg.configFile."hypr/scripts".source = ./scripts;
    xdg.configFile."hypr/animations.conf".source = ./animations.conf;
    xdg.configFile."hypr/keybindings.conf".source = ./keybindings.conf;
    xdg.configFile."hypr/windowrules.conf".source = ./windowrules.conf;

    # Conditional monitor and Nvidia configurations
    xdg.configFile."hypr/monitors.conf".text = if config.hyprland.monitors.enable
      then builtins.readFile ./monitors.conf
      else "";

    xdg.configFile."hypr/nvidia.conf".text = if config.hyprland.nvidia.enable
      then builtins.readFile ./nvidia.conf
      else "";

    # Enable and configure Hyprland
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ./hyprland.conf;
    };

    # Uncomment to enable swaylock (for locking the screen)
    # services.swaylock.enable = true;

    # Wayland-specific configuration
    home = {
      packages = with pkgs; [
        # Uncomment to add additional packages
        # grim
        # sway-contrib.grimshot
        # xwayland
        # hyprpicker
      ];

      # Set desktop environment variables
      sessionVariables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
      };
    };
  };
}
