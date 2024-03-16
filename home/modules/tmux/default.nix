
# ▀█▀ █▀▄▀█ █░█ ▀▄▀ 
# ░█░ █░▀░█ █▄█ █░█ 


_: { config, lib, pkgs, ... }:

{
  # Add options for tmux, a terminal prompt
  options.tmux.enable = lib.mkEnableOption "tmux";

  # Install tmux if desired
  config = lib.mkIf config.tmux.enable {

  };
}
