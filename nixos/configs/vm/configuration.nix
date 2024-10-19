
# █░█ █▀▄▀█   █▀▀ █▀█ █▄░█ █▀▀ █ █▀▀ █░█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█ 
# ▀▄▀ █░▀░█   █▄▄ █▄█ █░▀█ █▀░ █ █▄█ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█ 

inputs: { config, lib, pkgs, ... }:

{
  # Custom
  nix.flakes.enable = true;
  hyprland.enable = true;
  nvidia.enable = false;

  # Kernel
  # boot.kernalPackages = pkgs.linuxPackages_latest;

  # Timezone
  time.timeZone = "America/Los_Angeles";

  # Networking 
  networking.networkmanager.enable = true;

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Hardware
  hardware = {
    
    # Configure opengl
    opengl = {
      enable = true;
    };
  };

  # Sound 
  # sound.enable = false;
  hardware.pulseaudio.enable = false;

  # Environment
  environment = {
    
    # List packages installed in system profile
    systemPackages = with pkgs; [
      home-manager
      vim
      git
      git-lfs
      curl
      unzip
      btop
      lsd
      zoxide
      bat
      eza
      jq
      rlwrap
      ranger
      xdg-utils
      killall
      gparted
      neofetch
      libnotify
      qjackctl
      gnome-system-monitor
      nautilus
      adwaita-icon-theme
    ];
  };

  # Configure nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Configure security
  security.rtkit.enable = true;

  # Configure system-wide programs
  programs = {

    # Enable dconf
    dconf.enable = true;

    # Enable zsh
    zsh.enable = true;
  };

  # Configure system-wide services
  services = {

    # Enable flatpak for non-nix packages (or temporary broken packages)
    flatpak.enable = true;

    # Enable gnome virtual file system (enables trash)
    gvfs.enable = true;

    # Enable the OpenSSH daemon
    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };

    # Enable Pipewire for a/v (used for screensharing)
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      jack.enable = true;
    };

    # Enable CUPS to print documents
    printing.enable = true;

    # TEMP: Fix for nautilus and other gtk programs running slow
    gnome.at-spi2-core.enable = true;
  };

  # Enable portals
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Allow swaylock to work correctly
  # security.pam.services.swaylock = {};

  # Open ports in the firewall.
  networking.firewall = {
    enable = false;
    allowedTCPPortRanges = [];
    allowedUDPPortRanges = [
      { from = 32768; to = 60999; }
    ];
  };


  # Get location from geoclue
  location.provider = "geoclue2";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
