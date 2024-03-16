
# ▀▄▀ █▀▄ █▀▀ 
# █░█ █▄▀ █▄█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for xdg, utilities for managing home and system environment
  options.xdg.config.enable = lib.mkEnableOption "xdg.config";

  # Configure xdg if desired
  config = lib.mkIf config.xdg.config.enable {

    # Configure xdg
    xdg = {

      # Enable managing of xdg directories
      enable = true;

      # Support XDG Shared MIME-info specification
      mime.enable = true;

      # Allow files to be opened with appropriate programs
      mimeApps = {
        enable = true;

        # Configure default applications for mimetypes
        defaultApplications = {

          # Applications
          "application/zip" = ["org.gnome.Nautilus.desktop"];
          "application/octet-stream" = ["org.gnome.Nautilus.desktop" "chrome.desktop"];
          "application/x-compressed-tar" = ["org.gnome.Nautilus.desktop"];
          "application/x-xz-compressed-tar" = ["org.gnome.Nautilus.desktop"];
          "application/json" = ["neovide.desktop"];

          # Directories
          "inode/directory" = ["org.gnome.Nautilus.desktop"];

          # Text
          "text/html" = ["neovide.desktop" "chrome.desktop"];
          "text/markdown" = ["neovide.desktop"];
          "text/plain" = ["neovide.desktop"];
          "text/x-log" = ["neovide.desktop"];

          # Images
          "image/png" = ["org.gnome.gThumb.desktop" "chrome.desktop"];
          "image/jpg" = ["org.gnome.gThumb.desktop" "chrome.desktop"];
          "image/gif" = ["chrome.desktop"];

          # Email
          "x-scheme-handler/mailto" = ["chrome.desktop"];
        };
      };

      # Configure system directories
      systemDirs = {

        # Directory names to add to XDG_CONFIG_DIRS
        config = [];

        # Directory names to add to XDG_DATA_DIRS
        data = [];
      };

      # Configure user directories
      userDirs = {

        # Enable management of user directories
        enable = true;
        createDirectories = true;

        # Set directories
        desktop = "$HOME/Desktop";
        documents = "$HOME/Documents";
        download = "$HOME/Downloads";
        music = "$HOME/Music";
        pictures = "$HOME/Pictures";
        publicShare = "$HOME/Public";
        templates = "$HOME/Templates";
        videos = "$HOME/Videos";

        # Configure additional directories
        extraConfig = {
          CODE_DIR = "$HOME/Code";
          XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
        };
      };
    };
  };
}
