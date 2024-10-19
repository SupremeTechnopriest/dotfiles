
# █▀█ █▀█ █▀ ▀█▀ █ █▄░█ █▀▀ 
# █▀▀ █▄█ ▄█ ░█░ █ █░▀█ █▄█ 

_: { config, lib, pkgs, ... }:

{
  # Add options for sonarr
  options.posting.enable = lib.mkEnableOption "posting";

  # Install sonarr if desired
  config = lib.mkIf config.posting.enable {

    pkgs.poetry2nix

  };
}

{ config, pkgs, ... }:

let
  # Import poetry2nix
  poetry2nix = pkgs.poetry2nix;

  # Define the posting package
  posting = pkgs.poetry2nix.mkPoetryApplication {

    projectDir = pkgs.fetchFromGitHub {
      owner = "darrenburns";
      repo = "posting";
      rev = "main";  # You can specify a tag or commit hash for a specific version
      sha256 = "sha256-placeholder";  # We'll get the actual SHA256 in the next step
    };
  };
in
{
  # Your existing configuration...

  environment.systemPackages = with pkgs; [
    # Other packages...

    posting
  ];
}
